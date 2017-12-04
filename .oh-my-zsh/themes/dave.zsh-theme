PROMPT='[$(directory)]
$(username):$(folder) $(git_prompt_info) $(arrow) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

directory() {
  echo ${PWD/#$HOME/~}
}

username() {
  echo "%{$fg[red]%}%m%{$reset_color%}"
}

folder() {
  string="${PWD}"
  substring="/home/liam/Code/"
  if test "${string#*$substring}" != "$string"
  then
    pwd="${PWD/#$HOME/~}"
    pwd_list=(${(s:/:)pwd})
    pwd_list=('/' $pwd_list)
    folder="\e[38;05;33m$pwd_list[4]%{$reset_color%}:%{$fg[yellow]%}%c"
  else
    folder="%{$fg[yellow]%}%c"
  fi
  echo "$folder%{$reset_color%}"
}

arrow() {
  echo "%(?.\e[38;05;33m.\e[38;05;1m)"
  echo " $reset_color"
}

git_prompt_info() {
  #if [[ git rev-parse --is-inside-work-tree ]]; then
  if [[ -d .git ]]; then
    dirty=$(parse_git_dirty)
    if [[ -n $dirty ]]; then
      echo "$fg[blue]($(git symbolic-ref HEAD | cut -d'/' -f3)*)$reset_color"
    else
      echo "$fg[green]($(git symbolic-ref HEAD | cut -d'/' -f3))$reset_color"
    fi
  fi
}

