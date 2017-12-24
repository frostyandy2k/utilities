# MacPorts Installer addition on 2014-05-05_at_23:51:02: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Open a new tab in the current working directory
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

# Make history larger and available in all sessions
HISTSIZE=9000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups

history() {
  _bash_history_sync
  builtin history "$@"
}

_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  #builtin history -c         #3
  #builtin history -r         #4
}

PROMPT_COMMAND=_bash_history_sync

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

alias ll="ls -lah"
alias cd..="cd .."
alias insta="cd ~/instaguide/"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias gs="git status"
alias gc="git commit -m"
alias gp="git fetch && git pull"
alias glog="git log --decorate --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glogp="glog -p"
alias ga="git branch -a"
#alias subl='touch "$1" ; open -a "Sublime Text" "$1"'
function subl() { open -a "Sublime Text" "$1" || touch "$1" && open -a "Sublime Text" "$1"; }

export HOST=$(ifconfig en0 | grep 'inet ' | cut -f2 | awk '{print($2)}')
echo "HOST set to $HOST"

echo "Setting colorful terminal :)"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# disable XOF (so i-search ctrl+s works)
stty -ixon

echo "Ready, welcome Andrei"

# include docker alias file if it exists
if [ -f $HOME/personal/github_myrepos/docker-alias/zshrc ]; then
    . $HOME/personal/github_myrepos/docker-alias/zshrc
fi

##
# Your previous /Users/andreimiclaus/.profile file was backed up as /Users/andreimiclaus/.profile.macports-saved_2016-09-06_at_11:26:55
##

# MacPorts Installer addition on 2016-09-06_at_11:26:55: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# add brew bash-completion - for docker, compose, machine etc.
if [ -f $(brew --prefix)/etc/bash_completion ]; then  
. $(brew --prefix)/etc/bash_completion
fi  
