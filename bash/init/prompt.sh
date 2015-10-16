PS1_BASE="${BWhite}\u@\h${Color_Off} \W"

if [ -r /usr/share/git/git-prompt.sh ]; then
	. /usr/share/git/git-prompt.sh
	GIT_PS1_SHOWDIRTYSTATE=1
	PROMPT_COMMAND='__git_ps1 "${PS1_BASE}" "\\\$ " " ${Yellow}(%s)${Color_Off}"'
else
	PS1="${PS1_BASE}\$ "
fi
