#!/bin/bash


# Función para verificar si hay cambios sin hacer push en un repositorio de Git
function check_git_status() {
	# Obtener el estado del repositorio de Git
	status=$(git status --porcelain)
	remote=$(git remote)
	if [[ "$starting" == "2" ]] && [[ "$remote" ]]; then
		manual_commit
	elif [[ "$starting" == "1" ]]; then
		echo -e "${MAGENTA}${BOLD}${UNDERLINE}${PWD}${NC}"
		automatic_commit
	fi
}
