install: 
	#install commands
	python -m pip install --upgrade pip &&\
	python -m pip install -r requirements.txt
post-install:
	#post install
	python -m textblob.download_corpora
format: 
	#format code
	black *.py myLib/*.py
lint:
	#flake8 or #pylint
	pylint --disable=R,C,W1203 *.py myLib/*.py
test:
	#test
	python -m pytest -vv --cov=myLib --cov=main test_*.py


build:
	#build container
	docker build -t fastapi-wiki .

run:
	#run check if container exists and if so remove it then run container
	@if [ $$(docker ps -a -q -f name=fastapi-wiki) ]; then \
	docker rm -f fastapi-wiki; \
	fi
	docker run --name fastapi-wiki -p127.0.0.1:8080:8080 fastapi-wiki

all: install lint test format build run