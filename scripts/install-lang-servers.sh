#!/bin/bash

sudo pacman -S rust-analyzer bash-language-server texlab deno
sudo npm install -g vscode-langservers-extracted vim-language-server typescript typescript-language-server intelephense dockerfile-language-server-nodejs

echo '##############################################'
echo 'You still need to install manually sumneko_lua'
echo '##############################################'

echo 'good tutorial to install sumneko_lua ↴'
echo 'https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/'
