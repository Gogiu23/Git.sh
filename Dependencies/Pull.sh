#!/bin/bash

function pull() {
	clear
	while [[ "$pull_answer" != "1" && "$pull_answer" != "2" ]]; do
		echo -e "${GREEN}${BOLD}Are you wanna pull authomatically or manually?${NC}"
		echo -e "[Automathic will be fast but it will pull everywhere]"
		echo -e "[Manually is slow but pick every folder"
		echo -ne "${YELLOW}${BOLD}[1] Automathic"
		echo -e "\t\t\t[2] Manually${NC}"
		read -sn 1 pull_answer
	done
	if [[ "$pull_answer" == "1" ]]; then
		auto_pull
	else
		manual_pull
	fi
}

function auto_pull() {
	while true; do
	echo -e "\n${CYAN}${BOLD}Choose wich directory would you like to pull${NC}"
	echo -ne "${RED}${BOLD}[1] /${NC}"
	echo -e "\t\t\t${YELLOW}${BOLD}[2] HOME${NC}"
	echo -ne "${GREEN}${BOLD}[3] Desktop${NC}"
	echo -e "\t\t${MAGENTA}${BOLD}[4] Local diretory${NC}"
	read -sn 1 traces
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
	clear

	for dir in $(find "$traces" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do
		pushd "$dir/.." > /dev/null 2>/dev/null
		((i++))
		echo -ne "${GREEN}${BOLD}${UNDERLINE}["
		echo -ne ${i}
		echo -e "] ${PWD}"
		echo -e ${NC}${CYAN}${BOLD}
		git remote update
		git pull
	popd > /dev/null 2>/dev/null
done
	clear
	welcome
}

function manual_pull(){
	i=0
	while true; do
	echo -e "\n${CYAN}${BOLD}Choose wich directory would you like to pull${NC}"
	echo -ne "${RED}${BOLD}[1] /${NC}"
	echo -e "\t\t\t${YELLOW}${BOLD}[2] HOME${NC}"
	echo -ne "${GREEN}${BOLD}[3] Desktop${NC}"
	echo -e "\t\t${MAGENTA}${BOLD}[4] Local diretory${NC}"
	read -sn 1 traces
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
	for dir in $(find "$HOME" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do

		# Entrar al directorio del repositorio de Git
		pushd "$dir/.." > /dev/null 2>/dev/null
		((i++))
		clear
		echo -ne "${GREEN}${BOLD}${UNDERLINE}["
		echo -ne ${i}
		echo -e "] ${PWD}"
		echo -e ${NC}${GREEN}${BOLD}
		git remote update
		git status -uno
		echo -e
		echo -e "${RED}Would you like to pull?${NC}"
		echo -ne "${CYAN}${BOLD}[y] yes"
		echo -e "\t\t\t[n] no${NC}"
		read -sn 1 answer
		if [[ "$answer" == "y" ]]; then
			git pull
		fi

	# Regresar al directorio anterior
	popd > /dev/null 2>/dev/null
done
clear
welcome
}
