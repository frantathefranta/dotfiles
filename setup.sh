#!/bin/bash

mkdir -p ${HOME}/.config-backup && \
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} ${HOME}/.config-backup/{}

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME  config --local status.showUntrackedFiles no
