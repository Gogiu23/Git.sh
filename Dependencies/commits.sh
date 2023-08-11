#!/bin/bash

function commit() {
	if [[ "$starting" == "2" ]] && [[ "$remote" ]]; then
		manual_commit
	elif [[ "$starting" == "1" ]]; then
		automatic_commit
	else
		return "0"
	fi
}

