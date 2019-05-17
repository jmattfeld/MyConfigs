# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# mount my network drives
mount -t drvfs H: /mnt/h # my network drive
mount -t drvfs J: /mnt/j # software drive
mount -t drvfs P: /mnt/p # public drive

# some environment variables
WIN_HOME="/mnt/c/Users/Jeremy.SV"
WIN_SRC=${WIN_HOME}"/Source"
SOFTWARE="/mnt/h/software"
S_DRIVE="/mnt/j"
PUBLIC="/mnt/p"
MY_PUB=${PUBLIC}"/Jeremy"
HDD="/mnt/e"

# navigation aliases for Windows directories
alias wh='cd $WIN_HOME'
alias wdt='cd $WIN_HOME/Desktop'
alias wdc='cd $WIN_HOME/Documents'
alias wdl='cd $WIN_HOME/Downloads'
alias wsrc='cd $WIN_SRC'
alias swl='cd $SOFTWARE'
alias st='cd $SOFTWARE/ScanTel'
alias mps='cd $SOFTWARE/MPS4000'
alias dsaptp='cd $SOFTWARE/DSAPTP'
alias pc='cd $SOFTWARE/PressCal'
alias sdrv='cd $S_DRIVE'
alias sw='cd $S_DRIVE/Software'
alias pub='cd $PUBLIC'

# grep aliases for source code
alias mycppgrep='find . -iname "*.cpp" | xargs grep --color -n -s '
alias mycsgrep='find . -iname "*.cs" | xargs grep --color -n -s '
alias mycgrep='find . -iname "*.c" -o -iname "*.h" | xargs grep --color -n -s '
alias myhgrep='find . -iname "*.h" | xargs grep --color -n -s '

# git branch in prompt
parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h:\W\[\033[1;32m\]\$(parse_git_branch)\[\033[00m\]$ "
