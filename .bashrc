#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for i in ~/.bash/* ; do
	if [ -r "$i" ]; then
		. $i
	fi
done

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

export EDITOR=vim
export PATH=$PATH:~/bin


