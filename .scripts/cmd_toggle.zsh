#!/bin/zsh
if [[ -n $1 ]]
then
	if [[ -z $(pgrep $1) ]]
	then
		$1
	else
		pkill $1
	fi
else
	echo "Arg1 must be a cmd"
fi
