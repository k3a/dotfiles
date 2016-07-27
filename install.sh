#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for f in $(ls -A --ignore ".git*" --ignore "install.sh" "$DIR"); do
	echo "$f -> $HOME/$f"
	cp -R "$DIR/$f" "$HOME/"
done

