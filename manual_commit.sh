#!/bin/bash

# Función para hacer commits manualmente
function manual_commit() {
	# Comprobar si hay cambios sin hacer commit ni push
	if [[ -n "$status" ]]; then
		echo -e "${RED}Hay cambios sin hacer commit ni push en: $(pwd)\n${NC}"
		echo -e "${CYAN}Do you want to stage and push theese unstages changes?\n${NC}"
		echo -e "${YELLOW}(type ${BOLD}${RED}yes${NC}${YELLOW} or ${BOLD}${RED}no${NC}${YELLOW} or ${BOLD}${RED}diff${NC}${YELLOW} in case you wanna know the diffs)${MAGENTA} "
		read answer

		if [[ "$answer" == "diff" ]]; then
			git diff
		fi
		echo -e "${YELLOW}Still wanna stage and push? (yes or no) ${MAGENTA}" 
		read answer
		if [[ "$answer" == "yes" ]]; then
			echo -e "${CYAN}Making commits...\n${NC}"
			git add .
			echo -e "${BLUE}Wanna add something as commentary to your commit? (if not the date would be print instead)\n${NC}" 
			echo -e "${YELLOW}(Write your comments or type no)${GREEN} " 
			read comment
			if [[ "$comment" == "no" ]]; then
				comment=$(date)
				echo "$comment"
			fi
			git commit -m "$comment"
			git push
			echo -e "${NC}"
			fi
		fi

	}
