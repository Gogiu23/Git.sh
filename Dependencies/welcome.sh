#!/bin/bash

welcome() {
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

	echo -e "how would you like to proceed?\n"
	while [[ "$starting" != "1" && "$starting" != "2" ]]; do
		echo -e "${BLUE}[1]. ${CYAN}Automathic"
		echo -e "each changes unstages will be commits\n"
		echo -e "${BLUE}[2]. ${RED}Manually"
		echo -e "check for every change before commit\n${NC}"
		read starting
		clear
	done
}
