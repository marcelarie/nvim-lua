#!/bin/bash

PROGRAMS="$HOME/programs"
BUILD_NVIM="sudo make CMAKE_BUILD_TYPE=Release install && nvim -v"

[ ! -d "$PROGRAMS" ] && mkdir "$PROGRAMS"
[ ! -d "$PROGRAMS/neovim" ] && git clone https://github.com/neovim/neovim "$PROGRAMS/neovim"

cd "$PROGRAMS/neovim/" || exit
if [ "$1" == "--head" ]; then
	git reset --hard HEAD~"$2"
fi
if [ "$1" == "--commit" ]; then
	git reset --hard "$2"
fi
git pull --all --stat

time (eval "$BUILD_NVIM") || (sudo make diskclean && eval "$BUILD_NVIM")
