#!/bin/bash

# This script makes the modules and examples to use the local installation of the provider
# rather than the official one vended on Terraform Registry.
# The changes made by this script are ONLY FOR TESTING AND MUST NOT BE PUSHED TO THE REPOSITORY.
#
# In practice, it replaces:
#
#   required_providers {
#     aws-parallelcluster = {
#       source  = "aws-tf/aws-parallelcluster"
#     }
#   }
#
# with:
#   required_providers {
#     aws-parallelcluster = {
#       source  = "terraform.local/local/aws-parallelcluster"
#     }
#   }
#
# Usage:  ./use-local-provider.sh

set -e

PROJECT_DIR="$(dirname "$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )")"

SED_CMD=sed

# On Mac OS, the default implementation of sed is BSD sed, but this script requires GNU sed.
if [ "$(uname)" == "Darwin" ]; then
  command -v gsed >/dev/null 2>&1 || { echo >&2 "[ERROR] Mac OS detected: please install GNU sed with 'brew install gnu-sed'"; exit 1; }
  SED_CMD=gsed
fi

_FILES=(
  "$PROJECT_DIR/terraform.tf"
  "$PROJECT_DIR/examples/clusters/terraform.tf"
  "$PROJECT_DIR/examples/full/terraform.tf"
  "$PROJECT_DIR/modules/clusters/terraform.tf"
)

for _file in "${_FILES[@]}"; do
   echo "Switching to local provider in $_file"
   $SED_CMD -i 's/aws-tf\/aws-parallelcluster/terraform.local\/local\/aws-parallelcluster/' "$_file"
done
