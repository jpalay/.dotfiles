function my {
    mysql --defaults-group-suffix=$@
}

function mcd {
    mkdir $1 && cd $1
}

function notify {
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

function whendone() {
    date
    time "$@"
    notify 'Finished task!' "$*"
}
