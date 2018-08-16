#!/usr/bin/env bash
export GI_VERSION="1.0.1"
GI_LOGO="$HOME/.dotfiles/helpers/gilogo.txt"

function gi() {

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
                        Version: $GI_VERSION

EOF

    echo "Converting your: gi $@"
    local action="$( echo $1 | awk '/^t/ { print substr($1, 2); }' )"
    shift
    echo "To: git $action $@"
    git $action $@
}

export gi
