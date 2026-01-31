bin_path=~/bin
dotnet_tools_path=~/.dotnet/tools
pipx_bin_path=~/.local/bin
npm_globals_path=~/.npm-global/bin
mkdir --parents $bin_path
export PATH="${bin_path}:${dotnet_tools_path}:${pipx_bin_path}:${npm_globals_path}:${PATH}"
export EDITOR=nvim
export BROWSER=zen-browser
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GPG_TTY=$(tty)
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/config
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Colorize man
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
