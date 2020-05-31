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
	pip install --upgrade pip &&\
		pip install -r requirements.txt

#install:
	# This should be run from inside a virtualenv

	

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	html_lint.py index.html

buildimage:
	docker build -t helloworld .
	docker images ls

pushimage:
	
	docker login --username partha14
	docker tag helloworld partha14/hellworld:v1 
	echo "Docker ID and Image: $dockerpath"
	docker push partha14/helloworld:v1

setcontext:
	aws eks --region us-west-2 update-kubeconfig --name eks-example --kubeconfig ~/.kube/eks-example

deployContainer:
	ansible-playbook -i inventory deploy-app.yml

all: setup install lint test
