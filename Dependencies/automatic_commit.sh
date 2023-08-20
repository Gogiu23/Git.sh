#!/bin/bash

function automatic_commit() {
	comment=$(date)
	echo -e "\n${RED}${BOLD}Proceeding with automatic_commit.${GREEN}${BOLD}"
	if [[ -n "$status" ]]; then
		if [[ "$counter" == "0" ]]; then

			echo -e "=-==-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=" > $log
		else
			echo -e "=-==-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log
		fi

		echo -e "Here the direction you are making changes\n" >> $log
		echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" >> $log

		echo -e "$PWD\n" >> $log
		git diff >> $log
		echo -e >> $log
		git add . >> $log
		echo -e >> $log
		git commit -m "$comment" >> $log
		echo -e "\n" >> $log
		git push >> $log
		echo -e
		echo -e "=-==-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=" >> $log
	fi
	((counter++))
}
