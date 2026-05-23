# bin to emacs style
bindkey -e
bindkey '^U' backward-kill-line

# PATHS
typeset -U path PATH   # remove duplicates automatically
path=(
	$HOME/.local/bin
	$HOME/opencode/bin
	$HOME/go/bin
	$path
)
export PATH

#nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Enable completion
autoload -Uz compinit
compinit -C -d "$HOME/.cache/zsh/.zcompdump"

# Useful options
setopt autocd
setopt correct
setopt interactivecomments
setopt PROMPT_SUBST

# Colors
autoload -Uz colors
colors

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Git branch in prompt
autoload -Uz vcs_info
precmd() { vcs_info }

# --> more info on git status
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{yellow}! %f'
zstyle ':vcs_info:*' stagedstr '%F{green}+ %f'
zstyle ':vcs_info:git:*' formats '%b %c%u'

# --> only branch showed
# zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
# --> underline prompt
PROMPT='
%K{238} %n %k%F{238}%f%F{blue} %~ %f %F{red}${vcs_info_msg_0_}%f
%F{white} %% %f'
# --> inline prompt
# PROMPT='%K{238} %n %k%F{238}%f%F{135} %1~ %F{red}${vcs_info_msg_0_}%f❯ '

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory        # don’t overwrite
setopt sharehistory         # share across terminals
setopt hist_ignore_dups     # no consecutive duplicates
setopt hist_ignore_all_dups # remove older duplicates
setopt hist_reduce_blanks   # trim extra spaces
setopt hist_verify          # show command before executing from history
setopt inc_append_history   # write immediately

# Search history based on what is already typed
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind the Up and Down arrows
bindkey '^[[A' up-line-or-beginning-search # Arrow Up
bindkey '^[[B' down-line-or-beginning-search # Arrow Down

# zoxide (smart cd)
eval "$(zoxide init zsh)"

# autosuggestion
# source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^f' forward-word # Ctrl+f to accept only one word suggestion
bindkey '^ ' autosuggest-execute  # Ctrl+Space to accept

# fzf
export FZF_DEFAULT_OPTS='
--height 40%
--layout=reverse
--border
--inline-info
--cycle
'

#alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias duh='du -h -d 0 */ | sort -h'
alias gp='git push'
alias gl='git pull'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias nv='nvim'
alias nvc="$EDITOR $HOME/.config/nvim/"
alias h="cd $HOME"
alias zc="$EDITOR $HOME/.zshrc"
alias zr="exec zsh"
alias vnv="source .venv/bin/activate"
alias py="python"
alias aria="aria2c --enable-rpc --rpc-listen-all --daemon"
alias i="sudo pacman -S"

#highlight
# source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# . "$HOME/.local/bin/env"

export DEBUG=1
