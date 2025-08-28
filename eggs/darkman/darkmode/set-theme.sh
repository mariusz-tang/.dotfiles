#!/usr/bin/zsh

xset-gtk-theme Adwaita-dark
THEME=dark-colors start-polybar
feh --bg-scale $(xdg-user-dir PICTURES)/backgrounds/dark
echo 'general.import = [ "themes/themes/gruvbox_dark.toml" ]' > ~/.config/alacritty/theme.toml
