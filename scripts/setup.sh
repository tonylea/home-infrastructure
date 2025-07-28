#!/bin/bash

# Ensure Homebrew is in PATH (support both Intel and Apple Silicon locations)
if [ -d "/opt/homebrew/bin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d "/usr/local/bin" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  echo "❌ Homebrew not found in standard locations."
  exit 1
fi

# Now safe to use brew
brew install helm terraform ansible kubectl