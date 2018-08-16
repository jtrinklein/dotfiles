SESSION=$USER

dash_client="$HOME/src/ppm-mspa-projectdashboard"
dash_api="$HOME/src/ppm-vapi-projectdashboard"

start_dash() {
    cd $dash_client
    vm start
    docker-compose up -d vapi
    yarn dev
    atom $dash_client
}

stop_dash() {
    cd $dash_client
    docker-compose down
    vm suspend
}

dash() {
    if [[ $1 == "start" ]]; then
        start_dash
    elif [[ $1 == "stop" ]]; then
        stop_dash
    else
        echo "$1 is not a supported command"
    fi
}

export start_dash
export dash
