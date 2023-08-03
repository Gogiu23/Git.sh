#!/bin/bash


# Función para verificar si hay cambios sin hacer push en un repositorio de Git
function check_git_status() {
	# Obtener el estado del repositorio de Git
	status=$(git status --porcelain)
	if [[ "$starting" == "2" ]]; then
		manual_commit
	fi
}
