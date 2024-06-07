#!/bin/bash

# This script cleans up the local Terraform environment by removing the directories and files
# creates by Terraform as part of the init, plan, apply phases.
#
# Usage:  ./clean.sh

set -e

PROJECT_DIR="$(dirname "$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )")"

echo "Removing .terraform directories"
find $PROJECT_DIR -type d -name ".terraform" | xargs rm -rf

echo "Removing terraform lock files"
find $PROJECT_DIR -type f -name ".terraform.lock.hcl" | xargs rm -rf

echo "Removing terraform plan files"
find $PROJECT_DIR -type f -name "tfplan" | xargs rm -rf
