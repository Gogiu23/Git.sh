#!/bin/bash

function commit() {
	clear
	echo -e "\n${BOLD}How would you like to proceed?"
	while [[ "$starting" != "1" && "$starting" != "2" ]]; do
		echo -e "${BLUE}${BOLD}[1]. ${CYAN}${BOLD}Automathic"
		echo -e "${BOLD}Everything will be Automathic\n"
		echo -e "${BLUE}${BOLD}[2]. ${RED}${BOLD}Manually"
		echo -e "${BOLD}check for every change manually\n${NC}"
		read -sn 1 starting
	done

	clear
	while true; do
	echo -e "\n${CYAN}${BOLD}Choose wich directory would you like to push${NC}"
	echo -ne "${RED}${BOLD}[1] /${NC}"
	echo -e "\t\t\t${YELLOW}${BOLD}[2] HOME${NC}"
	echo -ne "${GREEN}${BOLD}[3] Desktop${NC}"
	echo -e "\t\t${MAGENTA}${BOLD}[4] Local diretory${NC}"
	read -sn 1 traces
	clear
		case $traces in
			1)
				if [[ "$OSTYPE" = darwin* ]]; then
					traces="/"
					echo -e "${YELLOW}${BOLD}Entering in $traces"
				else
					traces="/"
					echo -e "${YELLOW}${BOLD}Entering in $traces"
				fi
				break
				;;
   	2)
				if [[ "$OSTYPE" = darwin* ]]; then
					traces="$HOME"
					echo -e "${YELLOW}${BOLD}Entering in $traces"
				else
					traces="$HOME"
					echo -e "${YELLOW}${BOLD}Entering in $traces"
				fi
				break
				;;
   	3)
				if [[ "$OSTYPE" = darwin* ]]; then
					traces="$HOME/Desktop"
					echo -e "${YELLOW}${BOLD}Entering in $traces"
				else
					traces="$HOME/Escritorio"
					echo -e "${YELLOW}${BOLD}Entering in $traces"
				fi
				break
				;;
   	4)
				traces="$PWD"
				echo -e "${YELLOW}${BOLD}Entering in $traces"
				break
				;;
		esac
	done
	find_git

	clear
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -e
	echo -ne "\t\t\t\t\t\t${GREEN}${BOLD}Nothing "
	echo -ne "${CYAN}${BOLD}to "
	echo -ne "${BLUE}${BOLD}be "
	echo -ne "${MAGENTA}${BOLD}done. "
	echo -ne "${YELLOW}${BOLD}Back "
	echo -ne "${RED}${BOLD}to begin. "
	sleep 2
	clear
	welcome
}

function find_git() {
	for dir in $(find "$traces" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do

		# Entrar al directorio del repositorio de Git
		pushd "$dir/.." > /dev/null 2>/dev/null

		counter=0
		# Verificar el estado del repositorio
		check_git_status

	# Regresar al directorio anterior
	popd > /dev/null 2>/dev/null
done
}
