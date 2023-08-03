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

welcome() {
	echo -e "Welcome at your Personal Git manager\n"
	echo -e "how would you like to proceed?\n"
	while [[ "$starting" != "1" && "$starting" != "2" ]]; do
		echo -e "${BLUE}[1]. ${CYAN}Automathic"
		echo -e "each changes unstages will be commits\n"
		echo -e "${BLUE}[2]. ${RED}Manually"
		echo -e "check for every change before commit\n${NC}"
		read starting
	done
}
