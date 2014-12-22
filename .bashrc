#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

TZ='America/Vancouver'
export TZ
PATH=$PATH:/home/$USER/bin
#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
IRCNICK=the-pete
export IRCNICK
export HISTCONTROL=ignorespace
export HISTSIZE=10000
export EDITOR='/usr/bin/vim'

function prompt.l() {
	PS1='\[\e[1;32m\](\A) <\h> [$PWD\[\e[m\] \[\e[1;30m\]\!\[\e[m\]\[\e[1;32m\] \$ \[\e[m\]'
}
function prompt.r() {
	PS1='\[\e[1;32m\](\A) <\h> [$PWD \$ \[\e[m\]'
}
function prompt.s() {
	PS1='\[\e[1;32m\]\h \$ \[\e[m\]'
}
function prompt.() {
	PS1='\[\e[1;32m\] \$ \[\e[m\]'
}

prompt.l

#PROMPT_COMMAND="history -a; history -n"

for i in $( cat ~/.ssh/config | grep 'Host ' | sed 's/Host //' ) ; do 
  echo "alias "$i"='ssh "$i"'"
done | sort -u > ~/.ssh/alias
. ~/.ssh/alias
rm -f ~/.ssh/alias

alias df=pydf
alias sprunge='curl -F "sprunge=<-" http://sprunge.us'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h -d1|sort -h'
alias matrix="cmatrix -basC blue -u 6"
alias clear='echo "Try ctl+l"'
alias cachepkg="mv -v *.pkg.tar.xz ../cache/pkg"
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias lal='ls -al|more'
alias pu='pushd'
alias po='popd'
alias vi='vim'
