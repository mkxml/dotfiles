#!/usr/bin/env zsh

# Check whether we already have a node installation
NODE_PATH=$(which node)

if [ "$NODE_PATH" = "" ]; then
  # First node installation
  # Just get latest node.js and npm
  nvm install node
else
  # Not the first node installation
  # Get node version before update
  PREVIOUS_NODE_VERSION=$(node -v)
  # Get latest node.js and npm
  nvm install node
  # Reinstall packages from previous version
  nvm reinstall-packages $PREVIOUS_NODE_VERSION
fi

# Alias default to latest node
nvm alias default node

echo "Done! Please restart your terminal session."
