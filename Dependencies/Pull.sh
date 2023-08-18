#!/bin/bash

function pull() {
	while [[ "$pull_answer" != "1" && "$pull_answer" != "2" ]]; do
		echo -e "${GREEN}${BOLD}Are you wanna pull authomatically or manually?${NC}"
		echo -e "[Automathic will be fast but it will pull everywhere]"
		echo -e "[Manually is slow but pick every folder"
		echo -ne "${YELLOW}[1] Automathic"
		echo -e "\t\t\t[2] Manually${NC}"
		read -sn 1 pull_answer
		exit;
	done
	mang_pull

	#for dir in $(find "$HOME" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do

}

function mang_pull() {
	echo -e "${YELLOW}Welcome to the pull manager${NC}"
	echo -e "Choose wich directory would you like to pull"
	i=0
	for dir in $(find "$HOME" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do

		# Entrar al directorio del repositorio de Git
		pushd "$dir/.." > /dev/null 2>/dev/null
		((i++))
		echo -n "["
		echo -n ${i}
		echo -e "] ${PWD}"
		echo -e
		git remote update
		git status -uno
		echo -e
		echo -e "${RED}Would you like to pull?${NC}"
		echo -n "[yes]"
		echo -e "\t\t\t[no]"
		read -sn 1 answer
		if [[ "$answer" == "yes" ]]; then
			git pull
		fi

	# Regresar al directorio anterior
	popd > /dev/null 2>/dev/null
done
read -sn 1 dir_pull
#		case $traces in
#			1)
#				if [[ "$OSTYPE" = darwin* ]]; then
#					traces="$HOME/Desktop/log.txt"
#					touch $traces
#				else
#					traces="$HOME/Escritorio/log.txt"
#					touch $traces
#				fi
#				break
#				;;
#			2)
	#				if [[ "$OSTYPE" = darwin* ]]; then
	#					traces="$HOME/Documents/log.txt"
	#					touch $traces
	#				else
	#					traces="$HOME/Documentos/log.txt"
	#					touch $traces
	#				fi
	#				break
	#				;;
#			3)
	#				if [[ "$OSTYPE" = darwin* ]]; then
	#					traces="$HOME/Downloads/log.txt"
	#					touch $traces
	#				else
	#					traces="$HOME/Descargas/log.txt"
	#					touch $traces
	#				fi
	#				break
	#				;;
#			4)
	#				traces="$PWD/log.txt"
	#				touch $traces
	#				break
	#				;;
	#		esac
	exit;
}
