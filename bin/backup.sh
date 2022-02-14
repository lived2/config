#!/bin/bash

BACKUP=backup
mkdir $BACKUP
cp ~/.config/nvim/init.vim* $BACKUP
cp ~/.config/nvim/coc-settings.json* $BACKUP
cp ~/.zshrc $BACKUP"/zshrc"
cp ~/.tmux.conf $BACKUP"/tmux.conf"
cp -rp ~/bin/ $BACKUP
#cp -rp ~/.config/ $BACKUP/
#cp -rp ~/.vim/ $BACKUP/

FILE=backup_"`date +%Y%m%d`".tar.gz
tar zcvf $FILE $BACKUP
mv $FILE /mnt/d/Install/WSL

rm -rf $BACKUP
