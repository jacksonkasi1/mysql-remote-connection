#!/bin/sh

# Ensure we are in the project root
cd "$(dirname "$0")"

# Set environment variables and create a .env file in root
ENV_FILE=".env"

# Clear existing .env file if it exists
rm -f $ENV_FILE

# Write environment variables to the .env file (get these from the leapcell environment)
echo "DB_HOST=$DB_HOST" >> $ENV_FILE
echo "DB_PORT=$DB_PORT" >> $ENV_FILE
echo "DB_USER=$DB_USER" >> $ENV_FILE
echo "DB_PASSWORD=$DB_PASSWORD" >> $ENV_FILE
echo "DB_NAME=$DB_NAME" >> $ENV_FILE

# Log the created .env file for debugging
echo "✅ Environment variables saved to $ENV_FILE"
cat $ENV_FILE