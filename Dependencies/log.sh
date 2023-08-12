#!/bin/bash

#if [[ "$OSTYPE" = darwin* ]]; then
#	echo "estoy en darwin"
#else
#	echo "no estas aqui"
#fi
#exit

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
				if [[ "$OSTYPE" = darwin* ]]; then
					traces="$HOME/Desktop/log.txt"
					touch $traces
				else
					traces="$HOME/Escritorio/log.txt"
					touch $traces
				fi
				break
				;;
			2)
				if [[ "$OSTYPE" = darwin* ]]; then
					traces="$HOME/Documents/log.txt"
					touch $traces
				else
					traces="$HOME/Documentos/log.txt"
					touch $traces
				fi
				break
				;;
			3)
				if [[ "$OSTYPE" = darwin* ]]; then
					traces="$HOME/Downloads/log.txt"
					touch $traces
				else
					traces="$HOME/Descargas/log.txt"
					touch $traces
				fi
				break
				;;
			4)
				traces="$PWD/log.txt"
				touch $traces
				break
				;;
		esac
	done
	commit
}
