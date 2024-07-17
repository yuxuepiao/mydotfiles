# Created by newuser for 5.8.1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ypiao/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/home/ypiao/nvim-linux64/bin:$PATH

export HTTP_PROXY=http://proxy-jf.intel.com:911
export HTTPS_PROXY=http://proxy-jf.intel.com:912
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTPS_PROXY
export NO_PROXY=.intel.com,localhost,127.0.0.1
export no_proxy=.intel.com,localhost,127.0.0.1

#source "$HOME/.zsh/spaceship/spaceship.zsh"
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vi="nvim"
alias vim="nvim"
alias ls="lsd"
alias cp="cp -i"
#alias cat="batcat"
alias bat="batcat"
alias tree="lsd --tree"
alias ll="lsd --alh"

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
if [ -e /home/ypiao/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ypiao/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
