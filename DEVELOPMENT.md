# DEVELOPMENT

## Requirements
* go 1.21.5+: https://go.dev/
* terraform 1.6.6+: https://developer.hashicorp.com/terraform/install?product_intent=terraform
* pre-commit 3.6.0+: https://pre-commit.com/
* git-secrets 1.3.0+: https://github.com/awslabs/git-secrets


## Setup
```
pre-commit install
git secrets --install
git secrets --register-aws
```
## Documentation
 Documentation is generated with terraform-docs. The config file is stored at
 `.config/.terraform-docs.yml`. See: https://github.com/terraform-docs/terraform-docs.
 Run `terraform-docs markdown ./` from the root of the repository to regenerate the README
 files.

## Testing
Tests require a connection to an AWS account so they cannot be considered unit tests. No resources are currently created. To run tests initialize terraform and run the test command. Tests exist in the main module and each submodule.

Example running tests for the main module. From the root of the repository run:

```bash
terraform init
terraform test
```

Example runnings tests for the required infra submodule:

```bash
cd ./modules/required_infra
terraform init
terraform test
```

## Checks

Fix terraform code by using the terraform fmt command.

From the root of the project run: `terraform fmt -recursive ./`

To check without fixing use: `terraform fmt -recursive -check ./`

## Examples
Three examples exist inside the `./examples` folder. By default these examples will deploy resources using the default profile in us-east-1. If customization is needed variables can be changed using a tfvars file.

To customize first create a `terraform.tfvars` similar to the following in one of the example folders:

```hcl
profile  = "some_profile"
role = "some_role"
region = "us-west-2"
```

Then run an init, plan, and apply to try out an example:

```bash
terraform init
terraform plan -out tfplan
terraform apply tfplan
```
