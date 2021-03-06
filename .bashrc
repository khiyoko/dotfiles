# 
# .bashrc
#

# PROMPT -------------------------------------------------------------
# Username(\u)@Current Directory(\W)
PS1='[\e[0;31m\u\e[0m@\e[0;32m\W\e[0m]$'

# PATH --------------------------------------------------------------- 
#Setting for Homebrew & VIM 8.0
export PATH=/usr/local/bin:$PATH
# to use keg-only formula installed by homebrew
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# GREP ---------------------------------------------------------------
# Bold & Red
export GREP_COLOR='01;31'
alias grep='grep -E --color=auto'
alias fgrep='fgrep -E --color=auto'

# LS and  LS_COLOR ---------------------------------------------------
# [POSITION]
# 1,2:Directory|3,4:Symlink:Socket|5,6:Pipe|7,8:Executable|9,10:Block
# 11,12:Character|13,14:Exec.w/ SUID|15,16:Exec.w/SGID
# 17,18:Dir,o+w,sticky|19,20:Dir,o+w:unsticky
# odd:foreground,even:background
# [COLOR]
# a:black,b:red,c:green,d:brown,e:blue,f:magenta,g:cyan,h:light grey
# x:default -- Uppercase means Bold
export LSCOLORS=gxcxfxdxBxegedabagacad
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -AG'

# HISTORY -----------------------------------------------------------
function share_history {
  history -a
  history -c
  history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

# PYENV -------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# HOMEBREW ----------------------------------------------------------
# to avoid warning messages on config
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"
