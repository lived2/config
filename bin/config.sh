#!/bin/bash

BACKUP=~/config
cp ~/.config/nvim/init.vim $BACKUP
cp ~/.config/nvim/coc-settings.json $BACKUP
cp ~/.zshrc $BACKUP
cp ~/.tmux.conf $BACKUP
cp -rp ~/bin/ $BACKUP
cp /mnt/d/Install/WSL/settings.json $BACKUP

