#!/bin/bash

function log() {
	while true; do
		echo -e "Choose where would you like to save the file log.txt"
		echo -ne "[1] Desktop"
		echo -e "\t\t\t[2] Documents"
		echo -ne "[3] Downloads"
		echo -e "\t\t\t[4] The actual PWD you are"
		read traces

		case $traces in
			1)
				traces="$HOME/Desktop/log.txt"
				break
				;;
			2)
				traces="$HOME/Documents/log.txt"
				break
				;;
			3)
				traces="$HOME/Downloads/log.txt"
				break
				;;
			4)
				traces="$PWD/log.txt"
				break
				;;
		esac
	done
}
