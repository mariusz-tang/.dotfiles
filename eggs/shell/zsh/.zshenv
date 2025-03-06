bin_path=~/bin
mkdir --parents $bin_path
export PATH="${PATH}:${bin_path}"
export EDITOR=nvim
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
