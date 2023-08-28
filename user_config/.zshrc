# Load aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# If not running interactively don't do anything
[[ $- != *i* ]] && return

# Enable colors
autoload -U colors && colors

bindkey "^[[H"	beginning-of-line
bindkey "^[[F"	end-of-line
bindkey "^[[3~"	delete-char

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Autocomplete non case sensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit

#Include hidden files
_comp_options+=(globdots)

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
# Search repos for missing commands
source /usr/share/doc/find-the-command/ftc.zsh 2>/dev/null

# Prompt
autoload -U promptinit; promptinit
PROMPT="%B%{$fg[yellow]%}%n %{$fg[white]%}in %{$fg[blue]%}%~ %b%{$fg[magenta]%}>%{$reset_color%} "
