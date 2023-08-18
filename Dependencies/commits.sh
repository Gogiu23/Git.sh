#!/bin/bash

function commit() {
	echo -e "how would you like to proceed?\n"
	while [[ "$starting" != "1" && "$starting" != "2" ]]; do
		echo -e "${BLUE}[1]. ${CYAN}Automathic"
		echo -e "Everything will be Automathic\n"
		echo -e "${BLUE}[2]. ${RED}Manually"
		echo -e "check for every change manually\n${NC}"
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
