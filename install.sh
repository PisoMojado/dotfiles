#!/usr/bin/env bash

DOT_DIR="$( cd "$( dirname "$0" )" && pwd )"

cd "${ZSH_DOT_DIR}"
git submodule update --init --recursive
cd -

# Install dot files for pre-req projects
${DOT_DIR}/bashdots/install.sh
${DOT_DIR}/zshdots/install.sh

# Install dot files local to this project
which stow
if [ $? = 0 ]
then
    stow -d ${DOT_DIR}/home -t ${HOME} chunkwm
    stow -d ${DOT_DIR}/home -t ${HOME} emacs
    stow -d ${DOT_DIR}/home -t ${HOME} git
    stow -d ${DOT_DIR}/home -t ${HOME} khd
    stow -d ${DOT_DIR}/home -t ${HOME} npm
    stow -d ${DOT_DIR}/home -t ${HOME} tmux
    stow -d ${DOT_DIR}/home -t ${HOME} vim
else
    echo "Please install GNU Stow before running installer"
fi

# Install termopen script
if [ ! -f "${HOME}/.local/bin/termopen" ]
then
    ln -s ${DOT_DIR}/termopen/termopen.macos.sh ${HOME}/.local/bin/termopen
fi

