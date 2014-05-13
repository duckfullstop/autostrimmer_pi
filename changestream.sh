#!/bin/bash
echo -e "Autostrim:"

if [ -z "$1" ]
then
    echo -n  "Enter the twitch stream's URL (assumes twitch.tv prefix if there isn't one): ";
    read newurl;
else
    newurl="$1";
fi

if [[ $newurl != *twitch.tv* ]]
then
    newurl="twitch.tv/$newurl";
fi

sudo sed -i "/S_URL/c\S_URL=$newurl" /etc/default/autostream
sudo service autostream restart
