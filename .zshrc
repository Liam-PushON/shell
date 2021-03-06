export ZSH=/home/liam/.oh-my-zsh
ZSH_THEME="dave"
plugins=(git)
source $ZSH/oh-my-zsh.sh

#Aliases
for file in ~/aliases/*.alias; do
  source "$file"
done

#Functions
for file in ~/functions/*.func; do
  source "$file"
done

#Paths
for file in ~/paths/*.path; do
  source "$file"
done

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
