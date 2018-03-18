#!/bin/bash
set -e # exit on fail
# Symlink from ~/.dotfiles to ~/
# Can handle nested links, e.g. symlink only .emacs.d/config
#   but not all of .emacs.d

function error_msg { echo "[ EXISTS ] $@"; }
function success_msg { echo "[ CREATE ] $@"; }

function checkedlink {
    # Check if exists then link if not
    fname="$destdir/$1"

    # Create intermediate directories as needed
    dname=$(dirname $fname)
    if [[ ! -d $dname ]]
    then
        echo "$1: Making dirs: $dname"
        mkdir -p $dname;
    fi

    # Attempt to create symlink, fail if a file / directory exists
    if [ -e "$fname" ]
    then
        error_msg "$fname"
        return
    else
        success_msg "$fname"
        ln -s "$srcdir/$1" "$destdir/$1"
    fi
}

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

srcdir=~/.dotfiles
destdir=~

#checkedlink .bashrc
#checkedlink .bash_profile
checkedlink .tmux.conf
#checkedlink .vimrc
checkedlink .config/nvim/init.vim
checkedlink .zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
