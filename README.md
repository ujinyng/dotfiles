## Backup

```
$ back _<option>
```
If command 
```
$ back _all
```
backup zsh, vim, tmux, git, fzf, nodejs, py, brew, etc

`_all` is not contain rclone and gdb

### other option

option: zsh, vim, tmux, git, fzf, nodejs, py, brew, etc, rclone, gdb

## Restore

First,  

  ```
  $ 1st _install  
  ```
then, install brew, oh-my-zsh and nvm, yarn, 
      set git config

Second, restore. There are two option

1) Restore all from **Dropbox** using Mackup

  ```
  $ mackup restore
  ```  
2) Selectively restore from **dotfiles** using stow by script

  ```
  $ setup.zsh
  ```

