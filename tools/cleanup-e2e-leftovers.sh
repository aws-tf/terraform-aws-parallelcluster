#!/usr/bin/env bash
#
# Deletes the resources that an end-to-end test run left behind, matching them
# by the suffix that identifies the run. The suffix is mandatory.
#
# Usage: cleanup-e2e-leftovers.sh <name-suffix> [--dry-run]

set -o pipefail

SUFFIX="${1:-}"
DRY_RUN="${2:-}"

function info() { echo "[cleanup] $*"; }

if [[ ! "${SUFFIX}" =~ ^-[A-Za-z0-9][A-Za-z0-9-]*$ ]]; then
  info "ERROR: expected a run suffix such as '-gh123-1-0', got '${SUFFIX}'. Refusing to run."
  exit 1
fi

function run() {
  if [[ "${DRY_RUN}" == "--dry-run" ]]; then
    info "WOULD RUN: $*"
  else
    info "RUN: $*"
    "$@" || info "WARNING: command failed: $*"
  fi
}

info "Cleaning up leftovers of the run identified by the suffix '${SUFFIX}'."

### CloudFormation stacks

# A cluster stack is named after the cluster it holds, so matching the suffix
# covers the clusters and the API stack alike, without assuming how the tests
# name them.
stacks="$(aws cloudformation list-stacks \
  --stack-status-filter CREATE_COMPLETE CREATE_FAILED CREATE_IN_PROGRESS \
  ROLLBACK_COMPLETE ROLLBACK_FAILED UPDATE_COMPLETE UPDATE_FAILED \
  UPDATE_ROLLBACK_COMPLETE UPDATE_ROLLBACK_FAILED DELETE_FAILED \
  --query "StackSummaries[?ends_with(StackName, '${SUFFIX}')].StackName" \
  --output text 2>/dev/null)"

deleted_stacks=()
for stack in ${stacks}; do
  run aws cloudformation delete-stack --stack-name "${stack}"
  deleted_stacks+=("${stack}")
done

# Every deletion is already in flight, so these waits overlap. They are what
# surfaces a stack that failed to delete.
if [[ "${DRY_RUN}" != "--dry-run" ]]; then
  for stack in "${deleted_stacks[@]}"; do
    info "Waiting for stack ${stack} to be deleted."
    aws cloudformation wait stack-delete-complete --stack-name "${stack}" ||
      info "WARNING: stack ${stack} was not deleted. Check what it still owns manually."
  done
fi

info "Done"
