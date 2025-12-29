# Install zinit, if not already installed, and source it.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit ice lucid as"program" pick"bin/git-dsf"
zinit load so-fancy/diff-so-fancy

# Load completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit
zinit cdreplay -q

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.toml)"
~/.config/zsh/greeter/greet-with-kuro

# Keybinds
bindkey -e

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Set $LS_COLORS
eval $(dircolors)

# Completion styling
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath'

# Pipx completions
eval "$(register-python-argcomplete pipx)"

# Color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls -hF --color=auto'
alias cat=bat

# ls
alias lr='ls -R'        # recursive ls
alias ll='ls -l'        # list format
alias la='ll -A'        # show hidden files
alias lx='ll -BX'       # sort by extension
alias lz='ll -rS'       # sort by size
alias lt='ll -rt'       # sort by date
alias lp='la | less'    # pager

# git
alias ga='git add'
alias gap='ga --patch'
alias gb='git branch'
alias gba='gb --all'
alias gbl='git blame'
alias gc='git commit'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gcl='git clone'
alias gd='git diff'
alias gds='gd --staged'
alias gi='git init'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gn='git switch -c'  # new branch
alias gp='git push'
alias gr='git reset'
alias gri='git rebase --interactive'
alias gs='git status'
alias gsw='git switch'
alias gu='git pull'

# Yolk
alias yolk="yolk "
alias yo="yolk "
alias ye="ls ~/.config/yolk/eggs/ | sed 's+/++' | fzf --prompt='Edit egg: ' --tmux | xargs yolk edit"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
