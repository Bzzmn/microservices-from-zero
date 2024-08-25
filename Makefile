install: 
	#install commands
	python -m pip install --upgrade pip &&\
	python -m pip install -r requirements.txt
format: 
	#format code
lint:
	#flake8 or #pylint
test:
	#test
deploy:
	#deploy
all: install lint test deploy