#!/bin/bash
alias dotconf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

mkdir -p ${HOME}/.config-backup && \
dotconf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} ${HOME}/.config-backup/{}

dotconf checkout

dotconf config --local status.showUntrackedFiles no
