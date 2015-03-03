function my {
    mysql --defaults-group-suffix=$@
}

function mcd {
    mkdir $1 && cd $1
}
