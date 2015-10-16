if [ -r /usr/share/git/git-prompt.sh ]; then
	. /usr/share/git/git-prompt.sh
	PS1='[\u@\h \W$(__git_ps1 " ${Yellow}(%s)${Color_Off}")]\$ '
else
	PS1='[\u@\h \W]\$ '
fi
