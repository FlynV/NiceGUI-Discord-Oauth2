# Makefile

.PHONY: all setup install configure start

all: setup install configure

setup:
	@echo "Creating a virtual environment..."
	python3 -m venv env
	@echo "Activating the virtual environment..."
	. env/bin/activate

install: setup
	@echo "Installing the required packages..."
	. env/bin/activate && pip install -r requirements.txt

configure: install
	@echo "Please enter the following informations :"
	@echo "Enter your discord bot token :"
	@read token; \
	echo "Enter your discord client secret :"; \
	read secret; \
	echo "Enter your discord client id :"; \
	read id; \
	echo "Enter your discord redirect url :"; \
	read url; \
	echo "Enter your discord OAuth2 url :"; \
	read oauth2; \
	echo "Generating a STORAGE_SECRET key..."; \
	secretstorage=$$(python -c 'import os; print(os.urandom(24).hex())'); \
	echo "DISCORD_TOKEN=$$token" > .env; \
	echo "DISCORD_CLIENT_SECRET=$$secret" >> .env; \
	echo "DISCORD_CLIENT_ID=$$id" >> .env; \
	echo "REDIRECT_URL=$$url" >> .env; \
	echo "OAUTH_URL=$$oauth2" >> .env; \
	echo "STORAGE_SECRET=$$secretstorage" >> .env; \
	echo "Configuration done! Do 'make start' to start the website."

start:
	@echo "Starting the website..."
	. env/bin/activate && ./env/bin/python3 ./auth.py