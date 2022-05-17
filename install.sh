#!/usr/bin/sh

# installs the pdfjam utility for all pacman, apt-get, yum, zypper based on which one is present
if [[ -n $(which pacman) ]]
then
    sudo pacman -S pdfjam
elif [[ -n $(which apt-get) ]]
then
    sudo apt-get install pdfjam
elif [[ -n $(which yum) ]]
then
    sudo yum install pdfjam
elif [[ -n $(which zypper) ]]
then
    sudo zypper install pdfjam
else
    echo "No pdfjam utility found. Please install pdfjam manually."
    exit 1
fi

sudo chmod +rx ppt2pdf.sh

# then copies ppt2pdf.sh to /usr/local/bin/
cp ppt2pdf.sh /usr/local/bin/

echo "ppt2pdf.sh has been installed. Please run 'ppt2pdf.sh -h' for usage information."