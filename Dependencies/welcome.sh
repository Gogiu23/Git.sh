#!/bin/bash

function welcome() {
	echo -e "${GREEN}${BOLD}"
	echo -e "${CYAN} 	  ____ _ _             _  "   
	echo -e "${YELLOW} 	 / ___(_) |_       ___| |__  "
	echo -e "${RED} 	| |  _| | __|     / __| '_ \ "
	echo -e "${MAGENTA} 	| |_| | | |_   _  \__ \ | | |"
	echo -e "${BLUE} 	 \____|_|\__| (_) |___/_| |_|"
	echo -e "${NC}"
	echo -ne "${CYAN}${BOLD}\tWelcome " 
	echo -ne "${YELLOW}${BOLD} at "
	echo -ne "${RED}${BOLD} your" 
	echo -ne "${MAGENTA}${BOLD} Personal" 
	echo -ne "${BLUE}${BOLD} Git" 
	echo -e "${GREEN}${BOLD} Manager\n${NC}"
	echo -e "Every action will be register in a file named log.txt\n"
	echo -e "${BOLD}${CYAN}Would you like to pull or push?\n${NC}"
	echo -ne "${GREEN}${BOLD}[1] Pull"
	echo -ne "\t\t[2] Push"
	echo -e "\t\t[3] Exit"
	read -sn 1 init
	if [[ "$init" == "2" ]]; then
		log
	elif [[ "$init" == "1" ]]; then
		pull
	else
		exit_script
	fi
}
