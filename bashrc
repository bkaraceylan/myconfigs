#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#if [ -f ~/.dir_colors/dircolors ]
#    then eval 'dircolors ~/.dir_colors/dircolors'
#fi
# PS1='[\u@\h \W]\$ '

#dircolors
eval `dircolors ~/.dir_colors/dircolors.256dark`

#git aware bash prompt
#source ~/.bash/git-prompt.sh # Show git branch name at command prompt
#export GIT_PS1_SHOWCOLORHINTS=true # Option for git-prompt.sh to show branch name in color

# Sexy Solarized Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Customized for the Solarized color scheme by Sean O'Neil

BASE03="\e[38;5;8m"
BASE02="\e[38;5;0m"
BASE01="\e[38;5;10m"
BASE00="\e[38;5;11m"
BASE0="\e[38;5;12m"
BASE1="\e[38;5;14m"
BASE2="\e[38;5;15m"
BASE3="\e[38;5;7m"
YELLOW="\e[38;5;3m"
ORANGE="\e[38;5;9m"
RED="\e[38;5;1m"
MAGENTA="\e[38;5;5m"
VIOLET="\e[38;5;13m"
BLUE="\e[38;5;4m"
CYAN="\e[38;5;6m"
GREEN="\e[38;5;2m"
BOLF=$(tput bold)
parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${CYAN}\]\u \[$BASE0\]at \[$CYAN\]\h \[$BASE0\]in \[$BLUE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$YELLOW\]\$(parse_git_branch)\[$BASE0\]\n\$ \[$RESET\]"

# Start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
