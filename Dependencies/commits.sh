#!/bin/bash

function commit() {
	echo -e "\n${BOLD}How would you like to proceed?"
	while [[ "$starting" != "1" && "$starting" != "2" ]]; do
		echo -e "${BLUE}${BOLD}[1]. ${CYAN}${BOLD}Automathic"
		echo -e "${BOLD}Everything will be Automathic\n"
		echo -e "${BLUE}${BOLD}[2]. ${RED}${BOLD}Manually"
		echo -e "${BOLD}check for every change manually\n${NC}"
		read -sn 1 starting
	done
	find_git
}

function find_git() {
	for dir in $(find "$HOME" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do

		# Entrar al directorio del repositorio de Git
		pushd "$dir/.." > /dev/null 2>/dev/null

		counter=0
		# Verificar el estado del repositorio
		check_git_status

	# Regresar al directorio anterior
	popd > /dev/null 2>/dev/null
done
}
