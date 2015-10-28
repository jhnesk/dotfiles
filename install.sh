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

Link()
{
	target=${1}
	link=${2}
	if [ ! -e ${link} -o -L ${link} ]; then
		ln -snif ${target} ${link}
	else
		echo "Warning: ${link} is an existing file. No link created."
	fi
}

LinkAll()
{
	dir=${1}
	if [ ! -e ${dir} ]; then
		mkdir -p ${dir}
	fi
	if [ ! -d ${dir} ]; then
		echo "Warning: ${dir} is not a directory. Ignoring files."
		return
	fi

	for file in ${@:2}
	do
		Link ${file} ${dir}/$(basename ${file})
	done
}

Bash()
{
	Link ${SCRIPT_PATH}/bash/bashrc ${HOME}/.bashrc
	LinkAll ${HOME}/.bash ${SCRIPT_PATH}/bash/init/*.sh
}

Vim()
{
	mkdir -p ${HOME}/.vim
	Link ${SCRIPT_PATH}/vim/vimrc ${HOME}/.vimrc
	LinkAll ${HOME}/.vim/ftplugin ${SCRIPT_PATH}/vim/ftplugin/*.vim
	LinkAll ${HOME}/.vim/spell ${SCRIPT_PATH}/vim/spell/*
	LinkAll ${HOME}/.vim/UltiSnips ${SCRIPT_PATH}/vim/UltiSnips/*.snippets

	mkdir -p ${HOME}/.vim/bundle
	Link ${SCRIPT_PATH}/vim/Vundle.vim ${HOME}/.vim/bundle/Vundle.vim
}

GnuPG()
{
	LinkAll ${HOME}/.gnupg ${SCRIPT_PATH}/gnupg/*
}

Git()
{
	Link ${SCRIPT_PATH}/git/config ${HOME}/.gitconfig
}

Bash
Vim
GnuPG
Git

