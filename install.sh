#!/usr/bin/env bash
#

SCRIPT_PATH="${BASH_SOURCE[0]}";
while [ -h "${SCRIPT_PATH}" ]
do
	SCRIPT_PATH=$(readlink "${SCRIPT_PATH}")
done
pushd . > /dev/null
cd $(dirname ${SCRIPT_PATH}) > /dev/null
SCRIPT_PATH=$(pwd);
popd  > /dev/null

PrependIfMissing()
{
	if [[ "${1}" =~ ^${2}.* ]]
	then
		echo "${1}"
	else
		echo "${2}/${1}"
	fi
}

Link()
{
	target=$(PrependIfMissing ${1} ${SCRIPT_PATH})
	link=$(PrependIfMissing ${2} ${HOME})

	mkdir -p $(dirname ${link})
	if [ ! -e ${link} -o -L ${link} ]; then
		ln -snif ${target} ${link}
	else
		echo "Warning: ${link} is an existing file. No link created."
	fi
}

LinkAll()
{
	pattern="${SCRIPT_PATH}/${1}"
	dir="${HOME}/${2}"
	if [ ! -e ${dir} ]; then
		mkdir -p ${dir}
	fi
	if [ ! -d ${dir} ]; then
		echo "Warning: ${dir} is not a directory. Ignoring files."
		return
	fi

	for file in ${pattern}
	do
		Link ${file} ${dir}/$(basename ${file})
	done
}

# bash
Link bash/bashrc .bashrc
Link bash/bash_profile .bash_profile
LinkAll "bash/include/*.sh" .bash

# vim
Link vim/vimrc .vimrc
LinkAll "vim/ftplugin/*.vim" .vim/ftplugin
LinkAll "vim/spell/*" .vim/spell
LinkAll "vim/UltiSnips/*.snippets" .vim/UltiSnips
Link vim/Vundle.vim .vim/bundle/Vundle.vim

# gnupg
LinkAll "gnupg/*" .gnupg

# git
Link git/config .gitconfig

# bin
LinkAll "bin/*" bin

# tmux
Link tmux/tmux.conf .tmux.conf
LinkAll "tmux/include/*.conf" .tmux

# Create include file for tmux
for file in ${HOME}/.tmux/*.conf
do
	echo "source ${file}"
done > ~/.tmux/tmux.include

