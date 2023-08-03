#!/bin/bash

# Función para verificar si hay cambios sin hacer push en un repositorio de Git
function check_git_status() {
  # Obtener el estado del repositorio de Git
  status=$(git status --porcelain)

  # Comprobar si hay cambios sin hacer commit ni push
  if [[ -n "$status" ]]; then
    echo -e "Hay cambios sin hacer commit ni push en: $(pwd)\n"
	read -p "Do you want to stage and push theese unstages changes? (type yes or no) " answer

	if [ "$answer" == "yes" ]; then
		echo -e "Making commits...\n"
		git add .
		read -p "Wanna add something as commentary to your commit? (if not the date would be print instead) (type yes or no) " comment
		if [ "$comment" == "no" ]; then
			comment = $(date)
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

