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

# Required for installing most things.
sudo apt-get install build-essential

sudo apt-get install curl git git-doc git-gui git-man gitk xclip -y

if [[ -f "$HOME/.ssh/id_rsa.pub" ]]; then
  echo "Skipping generation of SSH public key due to one already exists."
else
  echo "Generating SSH key."
  ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa"
fi

if [[ -f "$HOME/.ssh/id_rsa.pub" ]]; then
  echo "Copying SSH public key to the clipboard. Paste it into your Github account."
  xclip -selection clip < ~/.ssh/id_rsa.pub
  "$BROWSER" https://github.com/account/ssh
fi

echo "Configuring git globals."
echo -n "Enter your name and press [ENTER]: "
read name
echo -n "Enter your email address and press [ENTER]: "
read email

git config --global user.name "$name"
git config --global user.email "$email"

# Install rvm.
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo ""
echo "To install ruby using rvm execute the following commands."
echo "  source .bashrc"
echo "  bash < <(curl -s https://raw.github.com/davidtsadler/system/master/ruby)"

exit 0