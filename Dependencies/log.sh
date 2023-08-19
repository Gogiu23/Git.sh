#!/bin/bash

function log() {
	while true; do
		echo -e "${BOLD}Choose where would you like to save the file log.txt"
		echo -ne "${CYAN}${BOLD}[1] Desktop"
		echo -e "\t\t\t${YELLOW}${BOLD}[2] Documents"
		echo -ne "${RED}${BOLD}[3] Downloads"
		echo -e "\t\t\t${MAGENTA}${BOLD}[4] The actual PWD you are${NC}"
		read -sn 1 log

		case $log in
			1)
				if [[ "$OSTYPE" = darwin* ]]; then
					log="$HOME/Desktop/log.txt"
					touch $log
				else
					log="$HOME/Escritorio/log.txt"
					touch $log
				fi
				break
				;;
			2)
				if [[ "$OSTYPE" = darwin* ]]; then
					log="$HOME/Documents/log.txt"
					touch $log
				else
					log="$HOME/Documentos/log.txt"
					touch $log
				fi
				break
				;;
			3)
				if [[ "$OSTYPE" = darwin* ]]; then
					log="$HOME/Downloads/log.txt"
					touch $log
				else
					log="$HOME/Descargas/log.txt"
					touch $log
				fi
				break
				;;
			4)
				log="$PWD/log.txt"
				touch $log
				break
				;;
		esac
	done
	commit
}
