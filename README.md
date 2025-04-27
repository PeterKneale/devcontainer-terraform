# DEV Container - Terraform
Opening this repository in VS Code will prompt you to reopen the repository in a dev container. This creates a docker container, using the settings found in ./devcontainer/devcontainer.json It is a virtual dev environment allowing you to configure all tooling / scripts and ensures consistancy across developers / teams etc. It also pre-installs a range of useful VS Code Extensions such as shell script formatting etc.

- Note: It mounts your local `~/.ssh` and `~/.aws` folders into the container so that aws cli and git can be used with your host machines credentials / ssh keys / aws config etc.

## Commands

### Install tools
`make install`

### Check versions
`make versions`

### Linting
`make tflint/run`

## Makefile
This repo uses a makefile to capture repetitive, sequential or complex cli operations into a macro - make file tutorial

Make file autocomplete and aws cli autocomplete will be installed but you will need to restart your shell for them to activate. (It updates ~/.bashrc)

Type: `make <tab>`

Make files are stored in `/.make` and are organised by tool.
The `Makefile` in the root is for composing multiple commands, like installing all tools or displaying all versions.
Other examples of this pattern

- https://github.com/awslabs/aws-code-habits/tree/main/lib/make
- https://github.com/xuwang/aws-terraform/tree/master/resources/makefiles