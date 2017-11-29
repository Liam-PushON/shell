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

PATH=~/Programs/bin:$PATH
PATH=~/.composer/vendor/bin:$PATH
