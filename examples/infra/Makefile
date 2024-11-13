setup:
	@stat terraform.tfbackend > /dev/null 2>&1 || cp terraform.tfbackend.EXAMPLE terraform.tfbackend
	@stat terraform.tfvars > /dev/null 2>&1 || cp terraform.tfvars.EXAMPLE terraform.tfvars
	@echo "[INFO] Add your settings to terraform.tfbackend and terraform.tfvars"

deploy:
	terraform init -backend-config=terraform.tfbackend
	terraform plan -out tfplan
	terraform apply tfplan

clean:
	rm -rf .terraform
	rm -rf .terraform.lock.hcl
	rm -rf tfplan
