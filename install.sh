#!/usr/bin/env bash
#
#

SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

Link()
{
	if [ ! -e ${2} -o -L ${2} ]; then
		ln -sif ${1} ${2}
	else
		echo "Warning: ${2} is an existing file. No link created."
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

Link ${SCRIPT_PATH}/bash/bashrc ${HOME}/.bashrc
LinkAll ${HOME}/.bash ${SCRIPT_PATH}/bash/init/*.sh

mkdir -p ${HOME}/.vim
Link ${SCRIPT_PATH}/vim/vimrc ${HOME}/.vimrc
LinkAll ${HOME}/.vim/ftplugin ${SCRIPT_PATH}/vim/ftplugin/*.vim

mkdir -p ${HOME}/.vim/bundle
Link ${SCRIPT_PATH}/vim/Vundle.vim ${HOME}/.vim/bundle/Vundle.vim

