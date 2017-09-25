SESSION=$USER

PTB_CLIENT="$HOME/src/project-team-board"
PTB_API="$HOME/src/project-task-board-api"

start_boards() {
    tmux -2 new-session -d -s $SESSION

    # Setup a window PTB
    #tmux new-window -t $SESSION:1 -n 'PTB'
    tmux split-window -h
    tmux split-window -h
    tmux split-window -h
    
    tmux select-pane -t 3
    
    # run dynamodb
    tmux send-keys "cd $PTB_API" C-m
    tmux send-keys "gulp dynamodb" C-m

    tmux select-pane -t 2

    # run the api
    tmux send-keys "cd $PTB_API" C-m
    tmux send-keys "gulp serve" C-m

    tmux select-pane -t 1
    # Use the extra pane for whatever, start in client
    tmux send-keys "cd $PTB_CLIENT" C-m
    tmux send-keys "vm start" C-m

    tmux select-pane -t 0
    # run the client
    tmux send-keys "cd $PTB_CLIENT" C-m
    tmux send-keys "yarn run start" C-m

    tmux select-pane -t 1
    
    tmux select-layout main-horizontal

    # Attach to session
    tmux -2 attach-session -t $SESSION
}

stop_boards() {
    tmux select-pane -t 3
    tmux send-keys C-c "exit" C-m
    tmux select-pane -t 2
    tmux send-keys C-c "exit" C-m
    tmux select-pane -t 1
    tmux send-keys C-c "exit" C-m
    tmux select-pane -t 0
    tmux send-keys C-c "vm suspend" C-m
    tmux send-keys "exit" C-m
}

boards() {
    if [[ $1 == "start" ]]; then
        start_boards
    elif [[ $1 == "stop" ]]; then
        stop_boards
    else
        echo "$1 is not a supported command"
    fi
}

export start_boards
export boards
