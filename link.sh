#!/bin/bash
mkdir -p ~/bin
sudo apt-get install vim
ln -s /usr/bin/vim.gnome-py2  ~/bin/vi
ln -s /usr/bin/vim.gnome-py2  ~/bin/vim
ln -s $PWD/vimrc ~/.vimrc
