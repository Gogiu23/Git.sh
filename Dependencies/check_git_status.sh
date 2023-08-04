#!/bin/bash


# Función para verificar si hay cambios sin hacer push en un repositorio de Git
function check_git_status() {
	# Obtener el estado del repositorio de Git
	status=$(git status --porcelain)
	remote=$(git remote)
	echo -n "🟩"
	if [[ "$starting" == "2" ]] && [[ "$remote" ]]; then
		manual_commit
	elif [[ "$starting" == "1" ]]; then
		automatic_commit
	else
		return "0"
	fi
}
