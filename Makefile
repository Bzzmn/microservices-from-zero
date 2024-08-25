install: 
	#install commands
	python -m pip install --upgrade pip &&\
	python -m pip install -r requirements.txt
lint:
	#flake8 or #pylint
	pylint --disable=R,C,W1203 *.py myLib/*.py
test:
	#test
	python -m pytest -vv --cov=myLib test_logic.py
format: 
	#format code
	black *.py mylib/*.py
build:
	#build container
deploy:
	#deploy
all: install lint test deploy