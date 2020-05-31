## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	sudo yum install -y python3
	sudo yum -y install python-pip 
	python3 -m venv ~/.devops
	sudo yum -y install docker
	source ~/.devops/bin/activate
	#pip install --user --upgrade pip &&\
		#pip install --user -r requirements.txt
	python3 -m pip install --user hadolintw
	python3 -m pip install --user html-linter
	python3 -m pip install --user boto3
	python3 -m pip install --user botocore
	python3 -m pip install --user ansible
	python3 -m pip install --user requests
	python3 -m pip install --user openshift
	python3 -m pip freeze
#install:
	# This should be run from inside a virtualenv

buildimage:
	sudo systemctl start docker
	sudo docker build -t helloworld .
	sudo docker images ls

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	#hadolint Dockerfile
	#html_lint.py index.html
	echo 'test'
pushimage:
	
    sudo docker login --username $user --password $pass
	sudo docker tag helloworld partha14/helloworld:v1 
	echo "Docker ID and Image: $dockerpath"
	sudo docker push partha14/helloworld:v1

setcontext:
	aws eks --region us-west-2 update-kubeconfig --name eks-example --kubeconfig ~/.kube/eks-example

deployContainer:
	ansible-playbook -i inventory deploy-app.yml

all: setup install lint test
