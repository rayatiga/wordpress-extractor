#!/bin/bash

r='\033[0;31m'      # Red
g='\033[0;32m'      # Green
y='\033[0;33m'      # Yellow
n='\033[0m'         # No Color

if [ "$EUID" -ne 0 ]
  then echo -e "${r}Please run as root!${n}"
  exit
fi

echo -e "\nChecking prerequisites file.."

FILE=latest.tar.gz
if [ -f "$FILE" ]; then
    echo -e "${g}Passed. File $FILE exists.${n}\n"
else 
    echo -e "${r}File $FILE does not exist. Exiting...${n}"
    exit
fi

read -p "Enter directory name [$(echo -e $y)my-site$(echo -e $n)]: " dir
dir=${dir:-my-site}

echo "Your directory is: $dir/"

echo -e "\nExtracting latest.tar.gz..."
sudo tar -xvf latest.tar.gz > /dev/null 2>&1

echo "Moving directory name to: $dir/"
sudo mv wordpress/ "$dir/" > /dev/null 2>&1

echo "Change permission to www-data for: $dir/"
sudo chown -R www-data: "$dir/" > /dev/null 2>&1

echo -e "\n${g}Finished.${n} Don't forget to create database for '$dir/' too!\n"

echo "Overview list of file in this directory:"
ls -la | grep "$dir" --color=auto
