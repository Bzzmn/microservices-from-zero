install: 
	#install commands
	python -m pip install --upgrade pip &&\
	python -m pip install -r requirements.txt
lint:
	#flake8 or #pylint
	pylint --disable=R,C,W1203 *.py myLib/*.py
test:
	#test
format: 
	#format code
	black *.py myLib/*.py
deploy:
	#deploy
all: install lint test deploy