export ZSH="/home/ec2-user/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Import aliases
if [ -f ~/.aws_aliases ]; then
    . ~/.aws_aliases
fi

# commandline vi shortcut
set -o vi

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

###############################################################3
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
###############################################################3
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# directory color for ls
export CLICOLOR=1

# file descriptor limit
ulimit -n 65535

# Node 18 LTS - Sep 23, 2023
export PATH="/home/linuxbrew/.linuxbrew/opt/node@18/bin:$PATH"
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/node@18/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/node@18/include"
