function my {
    mysql --defaults-group-suffix=$@
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
