install: 
	#install commands
	python -m pip install --upgrade pip &&\
	python -m pip install -r requirements.txt
post-install:
	#post install
	python -m textblob.download_corpora
lint:
	#flake8 or #pylint
	pylint --disable=R,C,W1203 *.py myLib/*.py
test:
	#test
	python -m pytest -vv --cov=myLib --cov=main test_*.py
format: 
	#format code
	black *.py myLib/*.py
build:
	#build container
	docker build -t fastapi-wiki . &&\
	docker tag fastapi-wiki:latest 247181180961.dkr.ecr.sa-east-1.amazonaws.com/myecr-repo:latest
run:
	#run check if container exists and if so remove it then run container
	@if [ $$(docker ps -a -q -f name=fastapi-wiki) ]; then \
	docker rm -f fastapi-wiki; \
	fi
	docker run --name fastapi-wiki -p127.0.0.1:8080:8080 deploy-fastapi

all: install lint test format build run