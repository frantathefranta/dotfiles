# Prerequisites
* git
* commands to be ran:

  ```
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  alias dotconf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  echo ".cfg" >> .gitignore
  git clone --bare git@github.com:frantathefranta/dotfiles.git $HOME/.cfg
  dotconf checkout
  dotconf config --local status.showUntrackedFiles no
  ```

# Need to do
* Add ssh key config
* Add handling of previous .rc files
