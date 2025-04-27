terraform/install:
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(shell lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt-get update && sudo apt-get -qq install --no-install-recommends --yes terraform terraform-ls
	@$(MAKE) --no-print-directory terraform/version

terraform/init: tfswitch/run terraform/fmt tflint/run
	terraform init

terraform/init/backend: tfswitch/run terraform/fmt
	terraform init -backend-config="backend.hcl"

terraform/fmt:
	terraform fmt
	terraform fmt -check=true

terraform/validate:
	terraform validate

terraform/plan: tfswitch/run terraform/fmt terraform/validate
	terraform plan

terraform/apply: tfswitch/run terraform/fmt terraform/validate
	terraform apply -auto-approve

terraform/destroy: tfswitch/run terraform/fmt terraform/validate
	terraform destroy -auto-approve

terraform/clean:
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f *.tfstate*
	rm -f *.tar.gz
	rm -f *.log

terraform/version:
	@terraform --version
