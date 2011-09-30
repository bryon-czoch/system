# SYSTEM

A Bash script for setting up a development enviroment on your computer.

Assumes that you have installed Ubuntu 11.04 - the Natty Narwhal.

## Usage

Open up a terminal and run the command below.

    bash <(wget -qO - https://raw.github.com/davidtsadler/system/master/setup)    

## What it sets up

* Creates a `projects` directory within your home directory if one doesn't already exist.
* SSH public keys if none exist.
* Installs git.
* Configures the git globals name and email.
* Installs rvm.
* Installs aptitude.
