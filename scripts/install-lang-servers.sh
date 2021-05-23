#!/bin/bash

sudo pacman -S rust-analyzer bash-language-server texlab deno
sudo npm install -g vscode-json-languageserver vscode-html-languageserver-bin vscode-css-languageserver-bin vim-language-server typescript typescript-language-server

echo '###################################################################'
echo 'You still need to install manually sumneko_lua and php-intelephense'
echo '###################################################################'

# good tutorial to install sumneko_lua ↴
# https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/

