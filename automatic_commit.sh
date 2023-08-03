#!/bin/bash

function automatic_commit() {
	comment=$(date)
	echo -e "${RED}Proceeding with automatic_commit.${GREEN}\n"
	if [[ -n "$status" ]]; then
		echo -e "$PWD" > $traces
		git add . > $traces
		git commit -m "$comment" >> $traces
		git push >> $traces
	fi
}
