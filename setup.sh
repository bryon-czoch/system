#!/usr/bin/env bash

#A Bash script for setting up a development enviroment on my computer.

ROOT_UID=0  # UID for root users
E_ROOT=1  # Root exit error

PROJECTS_DIR="$HOME/projects"

# Ask GNOME for the web browser command.
BROWSER=`gconftool-2 --get '/desktop/gnome/url-handlers/http/command' | cut -f1 -d' ' `

if [[ $EUID -eq 0 ]]; then
  echo "You cannot run this script as root!"
  exit $E_ROOT
fi

# Create a projects directory if one doesn't exist.
if [[ -d "$PROJECTS_DIR" ]]; then
  echo "Skipping creating of directory $PROJECTS_DIR due to it already existing."
else
  echo "Creating directory $PROJECTS_DIR"
  mkdir "$PROJECTS_DIR"
fi

# Using apt-get so ensure it is up to date first.
sudo apt-get update -y

echo "Installing packages."
sudo apt-get install xclip -y

if [[ -f "$HOME/.ssh/id_rsa.pub" ]]; then
  echo "Skipping generation of SSH key as one already exists."
else
  echo "Generating SSH key."
  ssh-keygen -t rsa
fi

if [[ -f "$HOME/.ssh/id_rsa.pub" ]]; then
  echo "Copying SSH public key to the clipboard. Paste it into your Github account."
  cat "$HOME/.ssh/id_rsa.pub" | xclip
  "$BROWSER" https://github.com/account/ssh
fi

exit 0