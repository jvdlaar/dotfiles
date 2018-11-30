source /home/johnny/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle vagrant
antigen bundle "greymd/docker-zsh-completion"
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen theme sabertazimi/dragon-zsh-theme
antigen apply

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# set Bash-style word delimiters
autoload -U select-word-style
select-word-style bash

# Set up the prompt
autoload -Uz promptinit
promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=999999999999
SAVEHIST=999999999999
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'




NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"




alias gclean='git branch | grep -v "master" | xargs git branch -D'

alias address='cd ~/sites/casco/services/address'
alias admin='cd ~/sites/casco/services/admin'
alias import='cd ~/sites/casco/services/import'
alias listing='cd ~/sites/casco/services/listing'
alias media='cd ~/sites/casco/services/media'
alias legacy='cd ~/sites/casco-legacy'
alias casco='cd ~/sites/casco'
alias rec='cd ~/sites/rec'
alias rec-cluster='cd ~/sites/rec-cluster'
alias components='cd ~/sites/casco-components'

alias dcomposer='docker-compose run --rm composer composer'
alias dphpunit='docker-compose -f docker-compose.test.yaml run --rm test bin/phpunit'
alias dc='docker-compose'
alias dcphp='docker-compose run --rm php-cli sh'

alias cascoPull='(git checkout master && git pull --rebase) && (cd services/address && git checkout master && git pull --rebase) && (cd services/media && git checkout master && git pull --rebase) && (cd services/import && git checkout master && git pull --rebase) && (cd services/listing && git checkout master && git pull --rebase) && (cd services/admin && git checkout master && git pull --rebase)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

