#!/bin/usr/env ncurses is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have ncurses first in your PATH run:
echo 'export PATH="/usr/local/opt/ncurses/bin:$PATH"' >> ~/.zshenv

# For compilers to find ncurses you may need to set:
  # 'export LDFLAGS="-L/usr/local/opt/ncurses/lib"' >> ~/.zshenv
  # 'export CPPFLAGS="-I/usr/local/opt/ncurses/include"' >> ~/.zshenv

# For pkg-config to find ncurses you may need to set:
  # 'export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"' >> ~/.zshenv

# Example configuration has been installed to:
  # /usr/local/opt/tmux/share/tmux

# Bash completion ha been installed to:
  # /usr/local/etc/bash_completion.d

tmux source ~/.tmux.confs
