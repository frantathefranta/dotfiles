## How to init
```sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME```

### Karabiner
* Whole directory has to be symlinked to not break (karabiner program writes to all files seemingly)
* Handled by script in `.chezmoiscripts` and ignore in `.chezmoiignore`

### Thanks
Thanks to [Allaman](https://github.com/Allaman/dots) and his dots repo for helping me figure out karabiner config storage
