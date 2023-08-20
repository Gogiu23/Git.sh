#!/bin/bash

# Función para hacer commits manualmente
function manual_commit() {
	# Comprobar si hay cambios sin hacer commit ni push
	if [[ -n "$status" ]]; then
		echo -e "\n${RED}Hay cambios sin hacer commit ni push en: $(pwd)\n${NC}"

		echo -e "${CYAN}Do you want to stage and push theese unstages changes?\n${NC}"

		echo -e "${YELLOW}(type ${BOLD}${RED}\n[y] yes${NC}\n${RED}${BOLD}[n] no\n[d] diff${NC}\n${YELLOW} in case you wanna know the diffs)${MAGENTA} "

		read -sn 1 answer

		if [[ "$counter" == "0" ]]; then
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" > $log
		else
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
		fi
		echo -e "All the changes manually should be recorded down here" >> $log
		echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log

		if [[ "$answer" == "d" ]]; then

			git diff
			echo -e "${YELLOW}Still wanna stage and push? (yes or no) ${MAGENTA}${BOLD}" 
			echo -e "[y] yes"
			echo -e "[n] no"
			read -sn 1 answer

		elif [[ "$answer" == "n" ]]; then
			return 1
		fi
		if [[ "$answer" == "y" ]]; then

			git diff >> $log
			echo -e "${CYAN}Making commits...\n${NC}"
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
			git add . >> $log
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
			echo -e "${CYAN}Wanna add something as commentary to your commit? (if not the date would be print instead)\n${NC}" 
			echo -e "${YELLOW}(Write your comments or type no)${GREEN} " 
			read comment

			if [[ !"$comment" ]]; then

				comment=$(date)
				echo "$comment"

			fi
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
			git commit -m "$comment" >> $log
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
			git push >> $log
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
			echo -e "${NC}"
			fi
		fi
		((counter++))
	}
