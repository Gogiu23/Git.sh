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
				touch $traces
				break
				;;
			2)
				traces="$HOME/Documentos/log.txt"
				touch $traces
				break
				;;
			3)
				traces="$HOME/Downloads/log.txt"
				touch $traces
				break
				;;
			4)
				traces="$PWD/log.txt"
				touch $traces
				break
				;;
		esac
	done
}
