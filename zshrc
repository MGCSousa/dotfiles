# ------------------------------------------- #
# .zshrc 
# ------------------------------------------- #

# language
export LANG=pt_PT.UTF-8

# autocomplete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# prompts
export PS1=$'\n%F{8}[%~]%f $ '

# ls colors (macOS)
export CLICOLOR=1
export LSCOLORS=GxBxfxdxCxegedabagaced

# basic aliases
alias \
	..="cd ../" \
	cp="cp -iv" \
	rm="rm -i" \
	mv="mv -i" \
	mkdir="mkdir -p" \
	grep="grep --color=auto" 

function mktar() { tar cvzf "${1%%/}.tar.gz" "${1%%/}/"; }
function mkzip() { zip -r "${1%%/}.zip" "$1"; }

# custom aliases
source ~/.aliases
