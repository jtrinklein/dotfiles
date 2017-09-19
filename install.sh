#!/bin/bash

DIR="$( cd -P "$( dirname "$( readlink "${BASH_SOURCE[0]}" )" )" && pwd )"
export DOTHOME="${DOTHOME:-$DIR}"

function ensure_link() {
  name=$1
  homefile="$HOME/$name"
  dotfile="$DOTHOME/$name"
  
  ln -sfv "$dotfile" "$homefile"
}

ensure_link ".zshrc"
ensure_link ".vimrc"
ensure_link ".tmux.conf"
ensure_link ".Brewfile"

OSNAME="$(uname -s)"
if [ "$OSNAME" = "Darwin" ]; then
  mkdir -p "$HOME/Library/KeyBindings"
  cp "$DOTHOME/DefaultKeyBinding.dict" "$HOME/Library/KeyBindings/"
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
