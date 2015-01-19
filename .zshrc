export PATH=$HOME/bin:$HOME/src/dotfiles/helpers:/opt/boxen/bin:/usr/local/bin:$PATH:~/scripts:~/Android
source ~/.bashrc
autoload colors zsh/terminfo

# vagrant gh creds
export gh_email="jtrinklein"
export gh_password=`node ~/scripts/crypt.js -d 8d54ca48854a5ddb688baaeff561e17f e15695583d4410e539e14f420c94e531`
export PHANTOMJS_BIN='/usr/local/bin/phantomjs'
export VM_HOSTNAME='WIN-2008R2SP1'
export DB_SERVER_NAME=$VM_HOSTNAME
export VM_VMX=`find ~/src/dev_ppm -name '*.vmx'`

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="better"
#ZSH_THEME="agnoster"

# use better git prompt
source ~/.zsh/git-prompt/zshrc.sh

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras knife lol nyan osx vagrant web-search)

source $ZSH/oh-my-zsh.sh

# User configuration


export EDITOR='vim'
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#directory profiles for git!
#
## Thanks to: Michael Prokop. 
## More documentation: 
## http://git.grml.org/?p=grml-etc-core.git;f=etc/zsh/zshrc;hb=HEAD#l1120
##

#show/hide hidden folders
showHiddenFolders()
{
    killall Finder
    defaults write com.apple.finder AppleShowAllFiles 1
}

hideHiddenFolders()
{
    killall Finder
    defaults write com.apple.finder AppleShowAllFiles 0
}

newbranch()
{
    git checkout -b $@
    git push -u origin head
}

rdp() {
    if [[ -n $1 ]]; then
        /Applications/Microsoft\ Remote\ Desktop.app/Contents/MacOS/Microsoft\ Remote\ Desktop $1
    else
        /Applications/Microsoft\ Remote\ Desktop.app/Contents/MacOS/Microsoft\ Remote\ Desktop ~/VM.rdp
    fi
}
vm() { 
    args="nogui"
    if [[ -n $2 ]]; then
        vmrun -T fusion $1 $VM_VMX nogui && rdp
    else
        vmrun -T fusion $1 $VM_VMX $args
    fi
}

#set aliases
alias zedit="vim ~/.zshrc"
alias zreload="source ~/.zshrc"

alias renpm="rm -rf ./node_modules ; npm install $@"
alias spa="cd ~/src/PpmSpa"
alias g="grunt $@"
alias gs="git status"
alias gd="git diff $@"
alias gdc="git diff --cached $@"
alias gsu="git submodule update"
alias npmrepo="slc registry use $@"
alias daptivnpm="npmrepo daptiv"
alias defaultnpm="npmrepo default"
alias mkpath="~/utils/python/mkpath.py $@"

