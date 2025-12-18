#!/usr/bin/zsh

theme_name=$1

if [[ $theme_name = dark ]]; then
    gtk_suffix='-dark'

    dunst_bg='#282828'
    dunst_fg='#fbf1c7'
    dunst_accent='#fabd2f'

    tmux_bg1='#3c3836'
    tmux_bg2='#504945'
    tmux_fg1='#ebdbb2'
    tmux_fg2='#a89984'
else
    dunst_bg='#fbf1c7'
    dunst_fg='#282828'
    dunst_accent='#b57614'

    tmux_bg1='#ebdbb2'
    tmux_bg2='#d5c4a1'
    tmux_fg1='#3c3836'
    tmux_fg2='#7c6f64'
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

hex_color='#[0-9a-f]\{6\}'

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
replace 'background = "'${hex_color}'"' 'background = "'${dunst_bg}'"' ~/.config/dunst/dunstrc
replace 'foreground = "'${hex_color}'"' 'foreground = "'${dunst_fg}'"' ~/.config/dunst/dunstrc
replace 'highlight = "'${hex_color}'"' 'highlight = "'${dunst_accent}'"' ~/.config/dunst/dunstrc
replace 'frame_color = "'${hex_color}'"' 'frame_color = "'${dunst_accent}'"' ~/.config/dunst/dunstrc
dunstctl reload

# Tmux.
replace 'status-style bg='${hex_color}'' 'status-style bg='${tmux_bg1} ~/.config/tmux/tmux.conf
replace 'status-right "#\[bg='${hex_color}',fg='${hex_color}',nobold\] #{user} #\[default\] #h "' 'status-right "#[bg='${tmux_bg2}',fg='${tmux_fg1}',nobold] #{user} #[default] #h "' ~/.config/tmux/tmux.conf
replace 'window-status-format "#{?window_bell_flag,#\[bg=magenta#,fg=black\],#\[bg='${hex_color}'#,fg='${hex_color}'\]}' 'window-status-format "#{?window_bell_flag,#[bg=magenta#,fg=black],#[bg='${tmux_bg2}'#,fg='${tmux_fg1}']}' ~/.config/tmux/tmux.conf
replace 'window-status-style bg='${hex_color}',fg='${hex_color}'' 'window-status-style bg='${tmux_bg1}',fg='${tmux_fg2} ~/.config/tmux/tmux.conf
tmux source-file ~/.config/tmux/tmux.conf
