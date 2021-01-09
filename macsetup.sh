#/bin/bash

# Sets up macOS with all the necessary programs and configuration.

function installCasks {
  casksFile="./brew/casks"
  while IFS= read -r line
  do
    yes | brew install --cask $line
  done < "$casksFile"
}

function installLeaves {
  leavesFile="./brew/leaves"
  while IFS= read -r line
  do
    yes | brew install $line
  done < "$leavesFile"
}

echo "Installing programs with Homebrew…"
installCasks
installLeaves
echo "Moving configuration files…"
cp .bashrc ~/
cp .tmux.conf ~/
echo "Setting up vim config…"
#bash vimsetup.sh
echo "Writing defaults…"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.finder AppleShowAllFiles YES
echo "Setup has finished."
