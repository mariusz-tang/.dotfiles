#!/usr/bin/zsh

theme_name=$1

xset-gtk-theme Adwaita-dark
sed 's/inherit = \(dark\|light\)-colors/inherit = '${theme_name}'-colors/' --in-place ~/.config/yolk/eggs/polybar/polybar/config.ini
feh --bg-scale $(xdg-user-dir PICTURES)/backgrounds/${theme_name}
echo 'general.import = [ "themes/themes/gruvbox_'${theme_name}'.toml" ]' > ~/.config/alacritty/theme.toml
echo '@import "colors/'${theme_name}'"' > ~/.config/rofi/colors/light-dark.rasi
