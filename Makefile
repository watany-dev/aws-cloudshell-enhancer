WORK := ${HOME}/.local/bin
INSTALL-OSL := sudo yum install -y openssl11 openssl11-devel > /dev/null 2>&1

install: eks cfn dy amplify git
version: ver-eks ver-cfn ver-dy
clean: rm-eks rm-cfn rm-dy rm-git

init:
	mkdir -p ${WORK}

#kubectl & eksctl
eks: init
	which kubectl || (curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl && sudo mv kubectl ${WORK}/)
	which eksctl || (curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp && sudo mv /tmp/eksctl ${WORK}/)
	which 'eksctl anywhere' || (curl --silent --location "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/31/artifacts/eks-a/v0.14.4/linux/amd64/eksctl-anywhere-v0.14.4-linux-amd64.tar.gz" | tar xz ./eksctl-anywhere && sudo mv ./eksctl-anywhere ${WORK}/)

rm-eks:
	rm ${WORK}/eksctl
	rm ${WORK}/eksctl-anywhere

ver-eks:
	eksctl version

# rain & cfn-lint
cfn: init
	which rain || (curl -OL https://github.com/aws-cloudformation/rain/releases/download/v1.3.2/rain-v1.3.2_linux-amd64.zip && unzip rain-v1.3.2_linux-amd64.zip && mv rain-v1.3.2_linux-amd64/rain  ${WORK}/ && rm -rf rain-v1.3.2_linux-amd64*)
	which cfn-lint || pip3 -q install cfn-lint

rm-cfn:
	sudo rm ${WORK}/rain
	sudo pip3 uninstall cfn-lint -y

ver-cfn:
	rain -v
	cfn-lint -v

# dynein
dy: init
	which openssl11 || ${INSTALL-OSL}
	which dy || (curl -O -L https://github.com/awslabs/dynein/releases/latest/download/dynein-linux.tar.gz && tar xzvf dynein-linux.tar.gz && sudo mv dy ${WORK}/)

rm-dy:
	sudo yum remove openssl11 openssl11-devel -y
	sudo rm ${WORK}/dy

# amplify
amplify: init
	which amplify || sudo npm install -g @aws-amplify/cli

# git-remote-codecommit
git: init
	pip3 -q install git-remote-codecommit

rm-git:
	sudo pip3 uninstall git-remote-codecommit -y
