#!/bin/bash

# SET CURRENT DIRECTORY
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

# COPY .FILES
echo "Start setup..."
for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitconfig.local.template" ] && continue

  ln -snfv ~/dotfiles/"$f" ~/
done

# COPY .gitconfig.local.template
[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

cat << END

------------------------------------
  DONE: dotfiles SETUP
------------------------------------

END
