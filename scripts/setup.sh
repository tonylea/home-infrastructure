#!/bin/bash

# Ensure Homebrew is in PATH
if [ -d "/opt/homebrew/bin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d "/usr/local/bin" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  echo "❌ Homebrew not found."
  exit 1
fi

# Install required tools if missing
brew list helm &>/dev/null || brew install helm
brew list terraform &>/dev/null || brew install terraform
brew list ansible &>/dev/null || brew install ansible
brew list kubectl &>/dev/null || brew install kubectl

# Print versions for sanity check
echo "✅ Installed versions:"
helm version
terraform version
ansible --version
kubectl version --client