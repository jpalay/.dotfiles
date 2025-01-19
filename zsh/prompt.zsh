source $DOTFILES/zsh/colors.zsh 
setopt PROMPT_SUBST


function git_branch_string() {
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if [[ $branch == "" ]];
  then
    :
  else
    echo " %{$(color BRIGHT_BLACK)%}($branch)%{%f%}"
  fi
}

function make_prompt {
    date_string="%{$(color BRIGHT_BLACK)%}[%D{%-I:%M%p | %b %-d}]%{%f%}"
    cwd_string="%{$(color YELLOW)%}%~%{%f%}"
    branch_string='$(git_branch_string)'
    user_string="%{$(color CYAN)%}%n@%m%{%f%}"

    echo ""
    echo "$date_string $cwd_string"
    echo "$user_string$branch_string$ "
}

PROMPT="$(make_prompt)"
