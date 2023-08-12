#!/bin/bash

function welcome() {
	echo -e "Welcome at your Personal Git manager\n"
	echo -e "Every action will be register in a file named log.txt"
	echo -e "Would you like to pull or push?\n"
	echo -n "[1] Pull"
	echo -e "\t\t\t[2] Push"
	read init
	if [[ "$init" == "2" ]]; then
		log
	else
		pull
	fi

}
