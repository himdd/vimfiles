#!/usr/bin/env bash
rm ~/.vim/bundle/Vundle.vim -rf
mv ~/.vim ~/.vimbak
mv ~/.vimrc ~/.vimrcbak
ln -s `pwd` ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
