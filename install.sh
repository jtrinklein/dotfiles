#!/bin/bash

DIR="$( cd -P "$( dirname "$( readlink "${BASH_SOURCE[0]}" )" )" && pwd )"
export DOTHOME="${DOTHOME:-$DIR}"

function ensure_link() {
  name=$1
  homefile="$HOME/$name"
  dotfile="$DOTHOME/$name"

  ln -sfv "$dotfile" "$homefile"
}
mkdir -p ~/.atom

#setup links
ensure_link ".zshrc"
ensure_link ".vimrc"
ensure_link ".tmux.conf"
ensure_link ".Brewfile"
ln -sfv "$DOTHOME/keymap.cson" "$HOME/.atom/keymap.cson"

#install atom packages
apm install cursor-history
apm install intentions
apm install busy-signal
apm install linter-ui-default
apm install linter
apm install atom-typescript
apm install editorconfig


OSNAME="$(uname -s)"
if [ "$OSNAME" = "Darwin" ]; then
    echo "configuring preferences for macos..."
    bash "$DOTHOME/setup-osx-preferences.sh"
fi

mkdir -p $HOME/.tmux/plugins
if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
  git clone git@github.com:tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

mkdir -p $HOME/.vim/{autoload,bundle,colors}
if [[ ! -e $HOME/.vim/autoload/pathogen.vim ]]
then
    echo "downloading pathogen..."
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if ! [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    ( cd $HOME/.vim/bundle/Vundle.vim && git pull )
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
