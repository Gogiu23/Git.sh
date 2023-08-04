#!/bin/bash

#COLORES
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

# Estilos
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
INVERT='\033[7m'

source Dependencies/welcome.sh
source Dependencies/check_git_status.sh
source Dependencies/manual_commit.sh
source Dependencies/automatic_commit.sh
source Dependencies/log.sh

welcome


# Bucle para recorrer las carpetas
for dir in $(find "$HOME" -ignore_readdir_race -type d -name '.git' -prune 2>/dev/null); do
			# Entrar al directorio del repositorio de Git
			pushd "$dir/.." > /dev/null

			counter=0
			# Verificar el estado del repositorio
			check_git_status

	# Regresar al directorio anterior
	popd > /dev/null
done

clear

echo -e "${YELLOW}Everything done!! Bye bye!!"
