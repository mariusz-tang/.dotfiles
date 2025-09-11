#!/usr/bin/zsh

xset-gtk-theme Adwaita
THEME=light-colors start-polybar
feh --bg-scale $(xdg-user-dir PICTURES)/backgrounds/light
echo 'general.import = [ "themes/themes/gruvbox_light.toml" ]' > ~/.config/alacritty/theme.toml
echo '@import "colors/light"' > ~/.config/rofi/colors/light-dark.rasi
