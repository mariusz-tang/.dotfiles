#!/usr/bin/zsh

theme_name=$1

if [[ $theme_name = dark ]]; then
    gtk_suffix='-dark'

    sed 's/background = "#[0-9a-f]\{6\}"/background = "#282828"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
    sed 's/foreground = "#[0-9a-f]\{6\}"/foreground = "#fbf1c7"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
    sed 's/highlight = "#[0-9a-f]\{6\}"/highlight = "#fabd2f"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
    sed 's/frame_color = "#[0-9a-f]\{6\}"/frame_color = "#fabd2f"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
else
    sed 's/background = "#[0-9a-f]\{6\}"/background = "#fbf1c7"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
    sed 's/foreground = "#[0-9a-f]\{6\}"/foreground = "#282828"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
    sed 's/highlight = "#[0-9a-f]\{6\}"/highlight = "#b57614"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
    sed 's/frame_color = "#[0-9a-f]\{6\}"/frame_color = "#b57614"/' --in-place ~/.config/yolk/eggs/dunst/dunstrc
fi

xset-gtk-theme Adwaita${gtk_suffix}
sed 's/inherit = \(dark\|light\)-colors/inherit = '${theme_name}'-colors/' --in-place ~/.config/yolk/eggs/polybar/polybar/config.ini
feh --bg-scale $(xdg-user-dir PICTURES)/backgrounds/${theme_name}
sed 's+general.import = \[ "themes/themes/gruvbox_\(dark\|light\).toml" \]+general.import = [ "themes/themes/gruvbox_'${theme_name}'.toml" ]+' --in-place ~/.config/alacritty/alacritty.toml
sed 's+@import "colors/\(dark\|light\)"+@import "colors/'${theme_name}'"+' --in-place ~/.config/yolk/eggs/rofi/config/common.rasi
dunstctl reload
