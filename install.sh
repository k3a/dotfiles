#!/bin/bash

# directory in which this script resides
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# update submodules
git submodule update --init --recursive

# for each file in the directory
for f in $(ls -A --ignore ".git" --ignore ".gitmodules" --ignore "install.sh" "$DIR"); do
	echo "$f -> $HOME/$f"
	cp -R "$DIR/$f" "$HOME/"
done

