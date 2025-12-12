#!/usr/bin/zsh

theme_name=$1

if [[ $theme_name = dark ]]; then
    gtk_suffix='-dark'
    dunst_bg='#282828'
    dunst_fg='#fbf1c7'
    dunst_accent='#fabd2f'
else
    dunst_bg='#fbf1c7'
    dunst_fg='#282828'
    dunst_accent='#b57614'
fi

function replace {
    original=$1
    target=$2
    file=$3
    delimiter=$4
    if [[ $delimiter == '' ]]; then
        delimiter='/'
    fi
    sed 's'${delimiter}${original}${delimiter}${target}${delimiter} --in-place ${file}
}

# GTK theme.
xset-gtk-theme Adwaita${gtk_suffix}

# Background.
feh --bg-scale $(xdg-user-dir PICTURES)/backgrounds/${theme_name}

# Polybar.
replace 'inherit = \(dark\|light\)-colors' 'inherit = '${theme_name}'-colors' ~/.config/polybar/config.ini

# Alacritty.
replace 'gruvbox_\(dark\|light\).toml' 'gruvbox_'${theme_name}'.toml' ~/.config/alacritty/alacritty.toml +

# Rofi.
replace '@import "colors/\(dark\|light\)"' '@import "colors/'${theme_name}'"' ~/.config/rofi/common.rasi +

# Picom.
replace 'unfocused-shader-\(light\|dark\)\.glsl' 'unfocused-shader-'${theme_name}'.glsl'  ~/.config/picom/picom.conf

# Dunst.
replace 'background = "#[0-9a-f]\{6\}"' 'background = "'${dunst_bg}'"' ~/.config/dunst/dunstrc
replace 'foreground = "#[0-9a-f]\{6\}"' 'foreground = "'${dunst_fg}'"' ~/.config/dunst/dunstrc
replace 'highlight = "#[0-9a-f]\{6\}"' 'highlight = "'${dunst_accent}'"' ~/.config/dunst/dunstrc
replace 'frame_color = "#[0-9a-f]\{6\}"' 'frame_color = "'${dunst_accent}'"' ~/.config/dunst/dunstrc
dunstctl reload
