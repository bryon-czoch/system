#!/bin/bash

#A Bash script for setting up a development enviroment on my computer.

ROOT_UID=0  # UID for root users
E_ROOT=1  # Root exit error

PROJECTS_DIR="$HOME/projects"

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

exit 0
