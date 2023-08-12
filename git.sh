#!/bin/bash

source $HOME/Escritorio/Git.sh/Dependencies/welcome.sh
source $HOME/Escritorio/Git.sh/Dependencies/check_git_status.sh
source $HOME/Escritorio/Git.sh/Dependencies/manual_commit.sh
source $HOME/Escritorio/Git.sh/Dependencies/automatic_commit.sh
source $HOME/Escritorio/Git.sh/Dependencies/log.sh
source $HOME/Escritorio/Git.sh/Dependencies/commits.sh
source $HOME/Escritorio/Git.sh/Dependencies/Colores.sh
source $HOME/Escritorio/Git.sh/Dependencies/Pull.sh

welcome


# Bucle para recorrer las carpetas
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

echo -e "${YELLOW}Everything done!! Bye bye!!"
