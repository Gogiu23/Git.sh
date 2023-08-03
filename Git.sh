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

source welcome.sh
source check_git_status.sh
source manual_commit.sh
source automatic_commit.sh
source log.sh

welcome
#exit

# Bucle para recorrer las carpetas
for dir in $(sudo find ~/. -type d -name '.git' -prune); do
	if [[ -d "$dir" ]]; then
		if [[ -r "$dir" ]] && [[ -x "$dir" ]]; then
			# Entrar al directorio del repositorio de Git
			pushd "$dir/.." > /dev/null

		# Verificar el estado del repositorio
		check_git_status

		# Regresar al directorio anterior
		popd > /dev/null
	else
		echo -e "${RED}You don't have permission to get inside $dir\n${NC}"
		fi
	else
		echo -e "${GREEN}The $dir doesn't exist${NC}\n"
	fi
done
