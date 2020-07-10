#!/usr/bin/env bash
export GI_VERSION="1.1.0"
GI_CF="$HOME/.gi"

function gi() {
    local count=0
    [ -f "$GI_CF" ] && count=$( cat "$GI_CF" )
    count=$( expr ${count:-0} + 1 )
    echo -n "$count" > "$GI_CF"
    local post='th'
    case "${count:(-1)}" in
        1)
            post='st'
            [[ ${count} == *'11' ]] && post='th'
            ;;
        2)
            post='nd'
            [[ ${count} == *'12' ]] && post='th'
            ;;
        3)
            post='rd'
            [[ ${count} == *'13' ]] && post='th'
            ;;
    esac
    cat <<EOF
       ___________   __________         __     _______    ______
      /  ________/ /__     ___/       /  /   /   _   /  /    __/
     /  /             /  /           /  /   /  / /  /  /   /_
    /  /  ____       /  /      ◆    /  /   /  / /  /  /   __/
   /  / /__  /      /  /       __  /  /   /  / /  /  /  /
  /  /___/  /    __/  /___   /  /_/  /   /  /_/  /  /  /__
 /_________/   /_________/  /_______/   /_______/  /_____/


┌─┬────────────────────────────────────────────────────────┬─┐
│ │                      Git Typo HERO                     │ │
└─┴────────────────────────────────────────────────────────┴─┘

         Coming to your rescue for the ${count}${post} time.
                        Version: $GI_VERSION

EOF
    echo "Converting your: gi $@"
    local action="$( echo $1 | awk '/^t/ { print substr($1, 2); }' )"
    shift
    echo "To: git $action $@"
    git $action $@
}

export gi
