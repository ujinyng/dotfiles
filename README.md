# Dotfiles for Backup and Restore

This repository is designed to back up Mac configuration files (dotfiles), other settings, plugins, and scripts used for installation and convenience. Most of the files here are automatically saved and synced to Dropbox, so these files are optional backups. The following instructions include steps for restoring files from Dropbox as well.


## Backup

To back up your environment, use the back command with `rsync`. `rsync` can be installed via Homebrew. The command format is:

```
$ back _<tool>
```
For detailed usage of the back command, refer to the following help message:
```
$ back help
Usage: back [OPTIONS] [GROUP_NAME]

  Back up the specified dotfile groups to the dotfiles repository using rsync with -azvhrubRL options.

  Groups:
    _git, _brew, _zsh, _vim, _fzf, _tmux, _gdb, _yarn, _python, _karabiner

  Options:
    -A, --all, all      Back up all groups
    -B, --basic, basic  Back up a predefined set of essential groups
                        (git, brew, zsh, vim, fzf, tmux, karabiner)
  
```


## Restore

To restore, run `bootstrap` and `setup`, which internally rely on `mackup` and `stow` for the restoration process. `mackup` and `stow` are installed as part of the `bootstrap` process, so there is no need to install them separately. Both tools can be installed via Homebrew."

To restore your environment, follow these steps:

1. Install essential tools and software:

  ```
  $ bootstrap
  ```
This will install Homebrew and reinstall all previously managed software using Homebrew. Next, run 'mackup restore' to restore settings such as .vimrc and other dotfiles related to git, zsh, vim, and others. Also, install oh-my-zsh, nodejs and yarn. 
Currently, the software may be set to use either specific versions or the latest versions, depending on the setup. It would be beneficial to allow for selection between these options in the future.

2. Selectively restore **dotfiles**:

Use the `setup` command to create symbolic links for dotfiles, or alternatively, copy them individually using `stow`, `rsync` or other methods. 

  ```
  $ setup _<tools>
  ```

To learn more about using the back command, check the  help option:
```
$ setup -h
Usage: setup [OPTIONS] [GROUP_NAME]...

  Restore specified dotfile groups using stow. Groups are symlinked to $HOME.
  Multiple groups can be listed separated by spaces.
  Use 'setup --basic' or 'setup -B' for a predefined set of essential groups.

  Groups:
    _vim, _zsh, _tmux, _git, _gdb, _fzf, _yarn, _python, _karabiner, _rclone

  Options:
    -B, --basic, basic  Restore a predefined set of essential groups
                        (_vim, _zsh, term)

  Example:
    setup _vim _zsh _tmux  # Restores vim, zsh, and tmux configurations
    setup -B              # Restores the basic configuration groups
```



Each folder in this repo is structured for use with `stow`. Some files, like those in dotfiles, are stored both in Dropbox and in this repository, allowing you to choose the source for restoration. However, currently, `1st` prioritizes fetching files from Dropbox first due to considerations for installation order and synchronization convenience. This means that symbolic links are created for files found in Dropbox. If a file is not present in Dropbox—whether intentionally omitted or missing—it will be obtained from the dotfiles repository.