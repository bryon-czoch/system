#!/usr/bin/env bash

# A Bash script for setting up a development enviroment on my computer.
# Will install ruby using rvm.

ROOT_UID=0  # UID for root users
E_ROOT=1  # Root exit error
E_RVM=2  # rvm not installed exit error

rvm="$HOME/.rvm/bin/rvm"

if [[ $EUID -eq 0 ]]; then
  echo "You cannot run this script as root!"
  exit $E_ROOT
fi

if [[ -e $rvm ]]; then
  rvm install 1.9.2-p290
else
  echo "It appears that rvm it not installed!"
  exit $E_RVM
fi

exit 0
