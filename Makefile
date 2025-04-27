export WORKSPACE=$(shell pwd)

include $(WORKSPACE)/versions.env

.PHONY: $(PHONY_TARGETS)

default:
	@echo "🚀 Run make install to get started"

install:
	@echo "🚀 Installing"
	@sudo apt update
	@sudo apt install --yes make
	@$(MAKE) --no-print-directory \
		terraform/install \
		terraform-docs/install \
		tflint/install \
		aws/cli/install \
		aws/cli/autocomplete
	@sudo update-ca-certificates
	@$(MAKE) --no-print-directory versions


versions:
	@echo "🚀 Versions:"
	@$(MAKE) --no-print-directory \
		terraform/version \
		terraform-docs/version \
		tflint/version \
		aws/cli/version \
		ubuntu/version
		
include .make/*.mk
