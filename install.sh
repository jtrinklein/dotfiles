#!/bin/bash

if [[ -z "$DOTHOME" ]]
then
    export DOTHOME=$HOME/src/dotfiles
fi

if [[ ! -e $HOME/.zshrc ]]
then
    ln -s $HOME/.zshrc $DOTHOME/.zshrc
fi


mkdir -p $HOME/.vim/{autoload,bundle,colors}
if [[ ! -e $HOME/.vim/autoload/pathogen.vim ]]
then
    echo "downloading pathogen..."
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [[ ! -e $HOME/.vim/colors/molokai.vim ]]
then
    echo "downloading molokai theme for vim"
    curl -Lo $HOME/.vim/colors/molokai.vim http://www.vim.org/scripts/download_script.php\?src_id\=9750
fi

if [[ ! -d $HOME/.vim/bundle/nerdtree ]]
then
    echo "downloading NERDTree plugin"
    git clone git@github.com:scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
fi

if [[ "$(which slc)" == "slc not found" ]]; then
    npm install -g strongloop
    slc registry add daptivnpm http://artrepo.daptiv.com:8081/artifactory/api/npm/npm-virtual
fi

git config --global user.email "james.trinklein@changepoint.com"
git config --global user.name "James Trinklein"
git config --global push.default simple
