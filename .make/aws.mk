aws/cli/install:
	@mkdir -p /tmp/awscli ;\
	cd /tmp/awscli ;\
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" --silent -o "awscliv2.zip" ;\
	unzip -qq awscliv2.zip ;\
	sudo ./aws/install --update ;\
	rm -rf /tmp/awscli ;\

aws/cli/autocomplete:
	@echo "complete -C '/usr/local/bin/aws_completer' aws" | tee --append ~/.bashrc
	@echo "complete -C '/usr/local/bin/aws_completer' aws" | tee --append ~/.zshrc

aws/cli/version:
	@aws --version