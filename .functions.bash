function my {
    mysql --defaults-group-suffix=$@
}

function mcd {
    mkdir $1 && cd $1
}

function echo_and_run {
    echo "$@"
    "$@"
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
