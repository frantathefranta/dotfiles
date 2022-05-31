# Prerequisites
* git
* commands to be ran:

  ```
  alias dotconf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  echo ".cfg" >> .gitignore
  git clone --bare git@github.com:frantathefranta/dotfiles.git $HOME/.cfg
  dotconf checkout
  dotconf config --local status.showUntrackedFiles no
  ```
