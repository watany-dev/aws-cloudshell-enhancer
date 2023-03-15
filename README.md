# aws-cloudshell-enhancer

This repository contains a Makefile that simplifies the installation and management of various AWS CLI tools, including kubectl, eksctl, rain, cfn-lint, and dynein. The Makefile allows you to quickly set up these tools on AWS Cloud Shell.

## Prerequisites

- AWS CloudShell

## Installation

To install the desired CLI tools, clone this repository and run the `install` target in the Makefile:

```bash
git clone https://github.com/username/aws-cli-tools-installer.git
cd aws-cli-tools-installer
make install
```

## Usage

- eks
- cfn (CloudFormation)
- dy (DynamoDB)
- amplify
- git (Codecommit)

### install

```bash
# Install all
make clean

# To install eksctl
make eks

# To install rain and cfn-lint
make cfn

...
```

Checking Installed Versions
To check the installed versions of the CLI tools, run the version target:


### version

```bash
make version
```

### Uninstall

Uninstalling Tools
To uninstall a specific tool, you can use the corresponding rm-* target:

```sh
# Uninstall all
make clean

# To uninstall eksctl
make rm-eks

# To uninstall rain and cfn-lint
make rm-cfn

# To uninstall dynein
make rm-dy
```

## Contributing
Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please submit an issue or create a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.