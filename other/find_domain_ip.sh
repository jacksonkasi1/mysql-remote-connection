#!/bin/bash

# Function to install a package if not already installed
install_if_needed() {
    local package=$1
    local command=$2

    if ! command -v $command &> /dev/null
    then
        echo "Installing $package..."
        sudo apt update -y
        sudo apt install -y $package
        echo "$package installed successfully."
    else
        echo "$package is already installed. Skipping installation."
    fi
}

# Install dig and nslookup only if needed
install_if_needed "dnsutils" "dig"
install_if_needed "dnsutils" "nslookup"

# Prompt for domain input
read -p "Enter the domain name: " domain_name

# Get the IP address using dig
echo "Using dig to find the IP address for $domain_name..."
dig +short $domain_name

# Get the IP address using nslookup
echo "Using nslookup to find the IP address for $domain_name..."
nslookup $domain_name
