#don't run on osx, only windows
if [ "$(uname)" = "Darwin" ] ; then
    return
fi
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;32m\] \n\$\[\033[00m\] '
export DISPLAY=:0.0

PATH=$PATH:/c/src/scripts

src() { cd /c/src ; }
chef() { cd /c/src/chef-repo ; }
ppm() { cd /c/src/ppm ; }
cogcli() { cd /c/src/cognosclient ; }
gs() { git status ; }
gd() { git diff ; }
gdc() { git diff --cached ; }
gcm() { git commit $@ ; }
gc() { git checkout $@ ; }
gsu() { git submodule update ; }
nyan() { telnet miku.acm.uiuc.edu ; }
troll() { cat ~/trollface ; echo trolled ;}
say() { curl http://10.2.60.104:8000/play -d "speak='`echo $@`'" ; }
matrix() { echo -e "\e[1;40m" ; cls ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|gawk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}' ; cls ; }

alias ls='ls --classify --color=always'

ppm
