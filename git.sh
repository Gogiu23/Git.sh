#!/bin/bash

dependency="$HOME/.config/git_sh"

if [[ -d "$dependency" ]]; then
	echo -e "The directory exist already. No change are made"
	cp -r Dependencies "$dependency" 
else
	echo -n "The directory doesn't exist. Creating"
	sleep 1
	echo -n "."
	sleep 1
	echo -n "."
	sleep 1
	echo "."
	mkdir "$dependency"
	cp -r Dependencies "$dependency" 
	if [[ $? -eq "0" ]]; then
		echo -e "Directory succesfully created"
	else
		echo -e "Error, the directory couldn't be created"
	fi
fi

bin_dir="$HOME/.localbin"
if [[ -d "$bin_dir" ]]; then
	echo -e "The directory exist already. No change are made"
	cp git.sh "$bin_dir"
else
	echo -n "The directory doesn't exist. Creating"
	sleep 1
	echo -n "."
	sleep 1
	echo -n "."
	sleep 1
	echo  "."
	mkdir "$bin_dir"
	cp git.sh "$bin_dir"
	if [[ $? -eq "0" ]]; then
		echo -e "Directory succesfully created"
	else
		echo -e "Error, the directory couldn't be created"
	fi
fi
clear

source $dependency/Dependencies/welcome.sh
source $dependency/Dependencies/Pull.sh
source $dependency/Dependencies/check_git_status.sh
source $dependency/Dependencies/manual_commit.sh
source $dependency/Dependencies/automatic_commit.sh
source $dependency/Dependencies/log.sh
source $dependency/Dependencies/commits.sh
source $dependency/Dependencies/Colores.sh
source $dependency/Dependencies/exit.sh

welcome

