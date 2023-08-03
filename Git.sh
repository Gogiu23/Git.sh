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

# Función para verificar si hay cambios sin hacer push en un repositorio de Git
function check_git_status() {
	# Obtener el estado del repositorio de Git
	status=$(git status --porcelain)

  # Comprobar si hay cambios sin hacer commit ni push
  if [[ -n "$status" ]]; then
	  echo -e "${RED}Hay cambios sin hacer commit ni push en: $(pwd)\n${NC}"
	  echo -e "${CYAN}Do you want to stage and push theese unstages changes?\n${NC}"
	  echo -e "${YELLOW}(type ${BOLD}${RED}yes${NC}${YELLOW} or ${BOLD}${RED}no${NC}${YELLOW} or ${BOLD}${RED}diff${NC}${YELLOW} in case you wanna know the diffs)${MAGENTA} "
	  read answer

	  if [[ "$answer" == "diff" ]]; then
		  git diff
	  fi
	  echo -e "${YELLOW}Still wanna stage and push? (yes or no) ${MAGENTA}" 
	  read answer
	  if [[ "$answer" == "yes" ]]; then
		  echo -e "${CYAN}Making commits...\n${NC}"
		  git add .
		  echo -e "${BLUE}Wanna add something as commentary to your commit? (if not the date would be print instead)\n${NC}" 
		  echo -e "${YELLOW}(Write your comments or type no)${GREEN} " 
		  read comment
		  if [[ "$comment" == "no" ]]; then
			  comment=$(date)
			  echo "$comment"
		  fi
		  git commit -m "$comment"
		  git push
		  fi
	fi
  }

# Bucle para recorrer las carpetas
for dir in $(find . -type d -name '.git' -prune); do
	# Entrar al directorio del repositorio de Git
	pushd "$dir/.." > /dev/null

  # Verificar el estado del repositorio
  check_git_status

  # Regresar al directorio anterior
  popd > /dev/null
done

