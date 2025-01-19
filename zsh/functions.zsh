function my {
    mysql --defaults-group-suffix=$@
}

function v() {
    local file="$1"
    if [ -z "$file" ]; then
        file="zshrc"
    fi

    local dotfiles=$HOME/.dotfiles

    if [[ -n $file ]]; then
        local filepath="$dotfiles/zsh/$file"
        if [ "$file" = "aliases" ]; then
            filepath="$dotfiles/.aliases"
        fi
        if [ ! -f "$filepath" ]; then
            if [ -f "$filepath.zsh" ]; then
                filepath="$filepath.zsh"
            else
                echo "USAGE: v {filename}"
                return 1
            fi
        fi
        vim $filepath
        source $filepath
    else
        echo "USAGE: v {filename}"
        return 1
    fi
}

function _v_autocomplete() {
    local search_dir="$HOME/.dotfiles/zsh"  # Directory to search files
    pushd "$search_dir" > /dev/null
    local -a files                             # Array to hold the file paths

    # Find all files in the specified directory, excluding temporary Vim files
    files=($(find . -type f \( -not -name '*~' -and -not -name '*.swp' -and -not -name '*swo' \) -exec basename {} \; ) "aliases")

    popd > /dev/null

    # Set the list of completions
    _describe 'file' files
}

compdef _v_autocomplete v

function docker_container_id {
    if [[ $1 == "bp" ]]; then 
       docker_container_id_helper "borrower-portal"
    else
        docker_container_id_helper "$1"
    fi
}

function docker_container_id_helper {
    local container_name="$1"
    local result=$(docker container list -a | grep $container_name | awk '{print $1}')
    local len=`echo $result | wc -l`
    if [ $len -gt 1 ]; then
        result=($(docker container list -a | grep $container_name | grep "app-" | awk '{print $1}'))
        len=`echo $result | wc -l`
    fi

    echo "$result"
}

function drestart {
    local container_id=$(docker_container_id $1)
    docker container stop $container_id
    docker container start $container_id
}

function dtail {
    while true; do
        docker container logs $(docker_container_id $1) -f -n 100
        sleep 1
    done
}

function dssh {
    docker exec -it $(docker_container_id $1) /bin/bash
}

function druff {
    docker exec -it $(docker_container_id flask) /bin/bash -c "cd /january/debtsy/debtsy && poetry run ruff check debtsy/ test/"
}

function mcd {
    mkdir $1 && cd $1
}

function alert {
    local usage="Usage: notify [title] message"
    local title=''
    local msg=''

    if [[ $# -lt 1 ]]; then
        echo $usage
        return 1
    elif [[ $# -lt 2 ]]; then
        title=$1
    elif [[ $# -lt 3 ]]; then
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

function hls {
    pbpaste | highlight --font=Consolas --font-size=30 --syntax=$1 -O rtf | pbcopy
}

function notify {
    date
    time "$@"
    alert 'Finished task!' "$*"
}

function psgrep {
    ps wup $(pgrep -f $*)
}

# Do this to avoid infinite loop of references
unalias workon 2> /dev/null
function workon_wrapper {
    workon $@
    retval=$?
    if [[ -n $@ ]] && [[ $retval -eq 0 ]]; then
         echo "$@" > ~/.last_venv.txt
    fi
    return $retval
}
