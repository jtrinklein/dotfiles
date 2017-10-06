# Here % indicates prompt expansion on the value, 
# %N indicates "The name of the script, sourced file,
# or shell function that zsh is currently executing,
# whichever was started most recently. If there is none,
# this is equivalent to the parameter $0."(from man zshmisc)

SOURCE="${(%):-%N}"
export DOTHOME="$( cd -P "$( dirname "$( readlink "$SOURCE" )" )" && pwd )"

export PATH=$HOME/.nodenv/shims:$HOME/bin:$DOTHOME/helpers:$HOME/.pyenv/shims:/usr/local/bin:/opt/boxen/bin:$PATH:$HOME/Library/Android/sdk/platform-tools
#source ~/.bashrc
source ~/.bash_profile
export FPATH=$FPATH:$DOTHOME/zshfunctions
autoload colors zsh/terminfo prettypath

# vagrant gh creds
export gh_email="jtrinklein"
if [[ $OSTYPE = darwin* ]] && [ -f "$HOME/scripts/crypt.js" ]
then
    #export gh_password=`node ~/scripts/crypt.js -d 8d54ca48854a5ddb688baaeff561e17f e15695583d4410e539e14f420c94e531`

fi
export DEFAULT_VAGRANT_PROVIDER=virtualbox
#export PHANTOMJS_BIN='/opt/boxen/phantomenv/shims/phantomjs'
export VM_HOSTNAME='WIN-2008R2SP1'
export DB_SERVER_NAME=$VM_HOSTNAME

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="better"
ZSH_THEME="kiwi"

# use better git prompt
# https://github.com/olivierverdier/zsh-git-prompt
if [[ -e ~/.zsh/git-prompt/zshrc.sh ]]
then
    source ~/.zsh/git-prompt/zshrc.sh
fi

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras git-flow-completion nyan battery vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'

source "$DOTHOME/managevms.sh"
source "$DOTHOME/helpers/boards.sh"

#set aliases
alias zedit="vim ~/.zshrc"
alias zreload="source ~/.zshrc"

alias renpm="rm -rf ./node_modules ; npm install $@"
alias spa="cd ~/src/PpmSpa"
alias g="gulp $@"
alias gs="git status"
alias gd="git diff $@"
alias gdc="git diff --cached $@"
alias gsu="git submodule update"
alias npmrepo="slc registry use $@"
alias daptivnpm="npmrepo daptiv"
alias defaultnpm="npmrepo default"
alias split="java -jar ~/llanfair/Llanfair.jar"
alias dc="docker-compose $@"
alias apiwatch="g watch --color | node_modules/.bin/bunyan"

eval $(thefuck --alias)
alias f="fuck"

export PPM_VM_IP=192.168.57.101


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jtrinklein/.nodenv/versions/6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jtrinklein/.nodenv/versions/6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jtrinklein/.nodenv/versions/6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jtrinklein/.nodenv/versions/6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
