tflint/install:
	@curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
	@echo "tflint installed successfully!"
	@$(MAKE) --no-print-directory tflint/version

tflint/init:
	@tflint --init

tflint/run:
	@tflint --recursive

tflint/version:
	@tflint --version