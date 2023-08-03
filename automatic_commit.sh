#!/bin/bash

function automatic_commit() {
	comment=$(date)
	echo -e "${RED}Proceeding with automatic_commit.${GREEN}\n"
	if [[ -n "$status" ]]; then
		echo -e "=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=" > $traces
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
