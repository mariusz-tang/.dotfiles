#!/usr/bin/zsh

theme_name=$1

if [[ $theme_name = dark ]]; then
    gtk_suffix='-dark'
fi

xset-gtk-theme Adwaita${gtk_suffix}
sed 's/inherit = \(dark\|light\)-colors/inherit = '${theme_name}'-colors/' --in-place ~/.config/yolk/eggs/polybar/polybar/config.ini
feh --bg-scale $(xdg-user-dir PICTURES)/backgrounds/${theme_name}
sed 's+general.import = \[ "themes/themes/gruvbox_\(dark\|light\).toml" \]+general.import = [ "themes/themes/gruvbox_'${theme_name}'.toml" ]+' --in-place ~/.config/alacritty/alacritty.toml
sed 's+@import "colors/\(dark\|light\)"+@import "colors/'${theme_name}'"+' --in-place ~/.config/yolk/eggs/rofi/config/common.rasi
