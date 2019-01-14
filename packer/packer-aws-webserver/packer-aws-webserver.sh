#!/bin/bash
sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt dist-upgrade -yq
sudo apt install nginx -y
sudo systemctl enable nginx