#!/bin/bash

# Create a virtual environment
echo "Creating a virtual environment..."
python3 -m venv env

# Activate the virtual environment
echo "Activating the virtual environment..."
source env/bin/activate

# Install the required packages
echo "Installing the required packages..."
pip install -r requirements.txt

# Ask the user infos to put in the .env file
echo "Please enter the following informations :"
echo "Enter your discord bot token :"
read token
echo "Enter your discord client secret :"
read secret
echo "Enter your discord client id :"
read id
echo "Enter your discord redirect url :"
read url
echo "Enter your discord OAuth2 url :"
read oauth2

# Generate a STORAGE_SECRET key
echo "Generating a STORAGE_SECRET key..."
secretstorage=$(python -c 'import os; print(os.urandom(24).hex())')

# Create the .env file
echo "DISCORD_TOKEN=$token" > .env
echo "DISCORD_CLIENT_SECRET=$secret" >> .env
echo "DISCORD_CLIENT_ID=$id" >> .env
echo "REDIRECT_URL=$url" >> .env
echo "OAUTH_URL=$oauth2" >> .env
echo "STORAGE_SECRET=$secretstorage" >> .env

echo "Configuration done ! Do ./start.sh to start the website."