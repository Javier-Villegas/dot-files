#!/bin/sh
directories=($(find . -type d | grep -v 'git'))

for dir in ${directories[@]}; do
	if [ $dir != "." ]; then
		mkdir -p $HOME/${dir:2}
		files=$(ls -Ap $dir | grep -v '/')
		for file in ${files[@]}; do
			ln -sf $(realpath $dir/file) $HOME/${dir:2}/$file
		done
	fi
done
