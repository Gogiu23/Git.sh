#!/bin/bash

# Función para hacer commits manualmente
function manual_commit() {
	# Comprobar si hay cambios sin hacer commit ni push
	if [[ -n "$status" ]]; then
		echo -e "\n${RED}Hay cambios sin hacer commit ni push en: $(pwd)\n${NC}"

		echo -e "${CYAN}Do you want to stage and push theese unstages changes?\n${NC}"

		echo -e "${YELLOW}(type ${BOLD}${RED}yes${NC}${YELLOW} or ${BOLD}${RED}no${NC}${YELLOW} or ${BOLD}${RED}diff${NC}${YELLOW} in case you wanna know the diffs)${MAGENTA} "

		read answer

		if [[ "$counter" == "0" ]]; then
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" > $traces
		else
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
		fi
		echo -e "All the changes manually should be recorded down here" >> $traces
		echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces

		if [[ "$answer" == "diff" ]]; then
			git diff >> $traces
			git diff
			echo -e "${YELLOW}Still wanna stage and push? (yes or no) ${MAGENTA}" 
			read answer
		elif [[ "$answer" == "no" ]]; then
			return 1
		fi
		if [[ "$answer" == "yes" ]]; then
			echo -e "${CYAN}Making commits...\n${NC}"
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
			git add . >> $traces
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
			echo -e "${CYAN}Wanna add something as commentary to your commit? (if not the date would be print instead)\n${NC}" 
			echo -e "${YELLOW}(Write your comments or type no)${GREEN} " 
			read comment
			if [[ "$comment" == "no" ]]; then
				comment=$(date)
				echo "$comment"
			fi
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
			git commit -m "$comment" >> $traces
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
			git push >> $traces
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
			echo -e "${NC}"
			fi
		fi
		((counter++))
	}
