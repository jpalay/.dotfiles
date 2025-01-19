function my {
    mysql --defaults-group-suffix=$@
}

function v {
    dotfiles=$HOME/.dotfiles
    fname=`ls -a $dotfiles | grep $1` | xargs echo
    full_path=dotfiles/$fname
    echo full_path
    return 0
}

function docker_container_id {
    if [ $1 == "bp" ]; then 
        docker container list | grep "borrower-portal" | awk '{print $1}'
        return 0
    elif [ $1 == "flask" ]; then 
        docker container list | grep "flask" | awk '{print $1}'
        return 0
    elif [ $1 == "nginx" ]; then 
        docker container list | grep "nginx" | awk '{print $1}'
        return 0
    else
        docker container list | grep $1 | awk '{print $1}'
        return 0
    fi
}

function drestart {
    local container_id=`docker_container_id $1`
    docker container stop $container_id
    docker container start $container_id
}

function dtail {
    while true;
        do docker container logs `docker_container_id $1` -f -n 100;
        sleep 1;
    done
}

function dssh {
    docker exec -it `docker_container_id $1` /bin/bash
}


function mcd {
    mkdir $1 && cd $1
}

function alert {
    local usage="Usage: notify [title] message"
    local title=''
    local msg=''

    if [ $# -lt 1 ]; then
        echo $usage
        return 1
    elif [ $# -lt 2 ]; then
        title=$1
    elif [ $# -lt 3 ]; then
        title=$1
        msg=$2
    else
        echo $usage
        return 1
    fi

    osascript -e "display notification \"$msg\" with title \"$title\""
}

function echo_and_run {
    echo "$@"
    "$@"
}

function hls () {
    pbpaste | highlight --font=Consolas --font-size=30 --syntax=$1 -O rtf | pbcopy
}

function notify() {
    date
    time "$@"
    alert 'Finished task!' "$*"
}

function psgrep() {
    ps wup $(pgrep -f $*)
}

# Do this to avoid infinite loop of references
unalias workon 2> /dev/null
function workon_wrapper() {
    workon $@
    retval=$?
    if [ "$@" ] && [ $retval -eq 0 ]; then
         echo "$@" > ~/.last_venv.txt
    fi
    return $retval
}
