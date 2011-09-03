#!/bin/bash

#A Bash script for setting up a development enviroment on my computer.

ROOT_UID=0  # UID for root users
E_ROOT=1  # Root exit error

if [[ $EUID -eq 0 ]]; then
  echo "You cannot run this script as root!"
  exit $E_ROOT
fi


exit 0
