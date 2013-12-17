ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local ul='╓'
local ur='╖'
local ll='╙'
local lr='╜'
pr_hbar='━'
post_prompt() {
    local battery="`battery.py`"
    battery=${(S%%)battery//</\%\{}
    battery=${(S%%)battery//>/\%\}}
    echo "╢ $battery ╟"
}

prompt_fill() {
    local wd=$( PWD | sed "s|^$HOME|~|" )
    local git="$(git_prompt_info)"
    local bat="`battery.py`"

    # pattern for removing non-visible characters
    local zero='%([BSUbfksu]|([FB]|){*})'

    # length of wd
    local prompt_length=${#${(S%%)wd//$~zero/}}
    # add length of git prompt
    prompt_length=$(( $prompt_length + ${#${(S%%)git//$~zero/}} ))
    # add 3 for .. not sure, but it works better
    # add 2 for '> '
    # add 1 for space after dir, 1 for space after filler
    # add 10 for battery meter
    prompt_length=$(( $prompt_length + 23 ))
    if [[ -n "$git" ]]
    then
        prompt_length=$(( $prompt_length + 1 ))
    fi

    local fillcount=$(( $COLUMNS - $prompt_length ))
    local filler="${(l:${fillcount}::━:)}"
    echo "%{${filler}%}"
}
PROMPT='${ul}${ret_status} %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}$(prompt_fill)$(post_prompt)${pr_hbar}${ur}
${ll}━━┫ '
RPROMPT='┣━━╢    %D{%I:%M}    ╟━${lr}'
