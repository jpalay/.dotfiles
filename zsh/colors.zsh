function color {
  case $1 in
    "BLACK") echo $'\e[30m' ;;
    "RED") echo $'\e[31m' ;;
    "GREEN") echo $'\e[32m' ;;
    "YELLOW") echo $'\e[33m' ;;
    "BLUE") echo $'\e[34m' ;;
    "MAGENTA") echo $'\e[35m' ;;
    "CYAN") echo $'\e[36m' ;;
    "WHITE") echo $'\e[37m' ;;
    "RESET") echo $'\e[0m' ;;
    "BRIGHT_BLACK") echo $'\e[90m' ;;
    "BRIGHT_RED") echo $'\e[91m' ;;
    "BRIGHT_GREEN") echo $'\e[92m' ;;
    "BRIGHT_YELLOW") echo $'\e[93m' ;;
    "BRIGHT_BLUE") echo $'\e[94m' ;;
    "BRIGHT_MAGENTA") echo $'\e[95m' ;;
    "BRIGHT_CYAN") echo $'\e[96m' ;;
    "BRIGHT_WHITE") echo $'\e[97m' ;;
    "BG_BLACK") echo $'\e[40m' ;;
    "BG_RED") echo $'\e[41m' ;;
    "BG_GREEN") echo $'\e[42m' ;;
    "BG_YELLOW") echo $'\e[43m' ;;
    "BG_BLUE") echo $'\e[44m' ;;
    "BG_MAGENTA") echo $'\e[45m' ;;
    "BG_CYAN") echo $'\e[46m' ;;
    "BG_WHITE") echo $'\e[47m' ;;
    "BG_BRIGHT_BLACK") echo $'\e[100m' ;;
    "BG_BRIGHT_RED") echo $'\e[101m' ;;
    "BG_BRIGHT_GREEN") echo $'\e[102m' ;;
    "BG_BRIGHT_YELLOW") echo $'\e[103m' ;;
    "BG_BRIGHT_BLUE") echo $'\e[104m' ;;
    "BG_BRIGHT_MAGENTA") echo $'\e[105m' ;;
    "BG_BRIGHT_CYAN") echo $'\e[106m' ;;
    "BG_BRIGHT_WHITE") echo $'\e[107m' ;;
    *) echo "Invalid color: $1" ;;
  esac
}
