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

ln -si ${SCRIPT_PATH}/bash/bashrc ${HOME}/.bashrc

mkdir -p ${HOME}/.bash

for file in ${SCRIPT_PATH}/bash/init/*.sh
do
	ln -si $file ${HOME}/.bash/
done

ln -si ${SCRIPT_PATH}/vim/vimrc ${HOME}/.vimrc

mkdir -p ${HOME}/.vim/ftplugin

for file in ${SCRIPT_PATH}/vim/ftplugin/*.vim
do
	ln -si $file ${HOME}/.vim/ftplugin/
done

