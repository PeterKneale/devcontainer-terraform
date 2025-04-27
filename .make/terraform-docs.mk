terraform-docs/install:
	@mkdir -p /tmp/download /tmp/extract \
	&& wget https://github.com/terraform-docs/terraform-docs/releases/download/v$(TERRAFORM_DOCS_VERSION)/terraform-docs-v$(TERRAFORM_DOCS_VERSION)-linux-amd64.tar.gz -O /tmp/download/terraform-docs-$(TERRAFORM_DOCS_VERSION)-linux-amd64.tar.gz --quiet --no-check-certificate \
	&& tar -C /tmp/extract -xzf /tmp/download/terraform-docs-$(TERRAFORM_DOCS_VERSION)-linux-amd64.tar.gz \
	&& sudo mv /tmp/extract/terraform-docs /usr/local/bin/ \
	&& rm -rf /tmp/download /tmp/extract
	@echo "terraform-docs installed successfully!"
	@$(MAKE) --no-print-directory terraform-docs/version

terraform-docs/version:
	@terraform-docs --version