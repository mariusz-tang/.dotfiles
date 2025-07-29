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
~/bin/greet-with-kuro

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

# Aliases
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias dotfilesui='/usr/bin/lazygit -g $HOME/.dotfiles/ -w $HOME'

# Color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls -hF --color=auto'

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
alias gc='git commit'
alias gca='gc --amend --no-edit'
alias gce='gc --amend'
alias gcl='git clone'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gds='gd --staged'
alias gi='git init'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gm='git merge'
alias gn='git switch -c'  # new branch
alias gp='git push'
alias gr='git reset'
alias gri='git rebase --interactive'
alias gs='git status --short'
alias gsw='git switch'
alias gu='git pull'

# Allow the use of the above with yolk
alias y="yolk "

# Accept (potentially wrong) vim exit commands
alias :q='exit'
alias :Q='exit'
alias :wq='exit'

# Shell integrations
eval "$(fzf --zsh)"

# nnn
# cd on quit
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

export NNN_ICONLOOKUP=1
export NNN_PLUG='p:preview-tui'
alias na='n -a -e -P p'
