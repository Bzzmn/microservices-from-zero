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
deploy:
	#deploy
all: install lint test deploy