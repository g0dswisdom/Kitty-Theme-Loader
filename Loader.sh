#!/bin/bash

read -p "Kitty theme name: " themeName
read -p "Your linux user: " user
line="include ./${themeName}.conf"
kittyFile="/home/${user}/.config/kitty/kitty.conf"

if [[ ! -f "./Themes/${themeName}.conf" ]]
then
     echo "That theme doesn't exist in the themes folder!"
else
     echo "Loading theme..."
     mv ./Themes/${themeName}.conf ~/.config/kitty/
     if grep -qF "$line" "$kittyFile"; then
        sed -i "s/$line/$line/g" "$kittyFile"
	echo "Done!"
	kitty
     else
	echo "$line" >> "$kittyFile"
	echo "Done!"
	kitty
     fi
fi