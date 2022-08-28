FROM ubuntu
FROM python:3
FROM gcc
FROM rust

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl

# Install rust-analyzer
# RUN mkdir -p /lsps/
# WORKDIR /lsps
# RUN git clone https://github.com/rust-lang/rust-analyzer.git && cd rust-analyzer
# RUN cargo xtask install --server

# Install neovim
WORKDIR /tmp
RUN git clone https://github.com/neovim/neovim
WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=Release
RUN make install

# Install essential neovim plugins
WORKDIR /root/.local/share/nvim/site/pack/packer/start
RUN git clone https://github.com/wbthomason/packer.nvim

# Deploy configuration
COPY . /root/.config/nvim

# Finish
WORKDIR /root/.config/nvim
RUN mv /root/.config/nvim/nix.init.lua /root/.config/nvim/init.lua
