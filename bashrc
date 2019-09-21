#!/usr/bin/env bash

set -o vi

shopt -s expand_aliases
shopt -s globstar
shopt -s histappend

HISTCONTROL=ignoreboth
HISTFILESIZE=1000000
HISTSIZE=1000000

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export PATH=$HOME/dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/go/libexec/bin:$(go env GOPATH)/bin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH

export GOPATH=$(go env GOPATH)

export FZF_DEFAULT_COMMAND="fd ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="blsd"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
	source "$config"
done
unset -v config

[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

generateSshKey() {
	ssh-keygen -t rsa -b 4096 -C "joshua.lim@dominionmarinemedia.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}
