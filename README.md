# SYSTEM

A Bash script for setting up a development enviroment on your computer.

Assumes that you have installed Ubuntu 11.04 - the Natty Narwhal.

## Usage

Open up a terminal and run the commands below.
    apt-get update -y
    apt-get install curl -y
    bash < <(curl -s https://raw.github.com/davidtsadler/system/master/setup.sh)

## What it sets up

* Creates a `projects` directory within your home directory if one doesn't already exist.
* SSH public keys if none exist.