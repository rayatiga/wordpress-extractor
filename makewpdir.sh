#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root!"
  exit
fi

read -p "Enter directory name [my-site]: " dir
dir=${dir:-my-site}

echo "Your directory is: $dir/"

echo "Extracting latest.tar.gz..."
sudo tar -xvf latest.tar.gz > /dev/null 2>&1

echo "Moving directory name to: $dir/"
sudo mv wordpress/ $dir/ > /dev/null 2>&1

echo "Change permission to www-data for: $dir/"
sudo chown -R www-data: $dir/ > /dev/null 2>&1

echo "Finished. Don't forget to create database for '$dir' too!"
ls -la | grep $dir
