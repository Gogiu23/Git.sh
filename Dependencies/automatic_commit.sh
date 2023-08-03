#!/bin/bash

function automatic_commit() {
	comment=$(date)
	echo -ne "${RED}Proceeding with automatic_commit.${GREEN}\r"
	if [[ -n "$status" ]]; then
		if [[ "$counter" == "0" ]]; then

			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" > $traces
		else
			echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
		fi

		echo -e "Here the direction you are making changes\n" >> $traces
		echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
		echo -e "$PWD\n" >> $traces
		git diff >> $traces
		echo -e >> $traces
		git add . >> $traces
		echo -e >> $traces
		git commit -m "$comment" >> $traces
		echo -e "\n" >> $traces
		git push >> $traces
		echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $traces
	fi
}
