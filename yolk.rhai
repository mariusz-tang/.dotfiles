import "theme" as theme;

export let base_colors = theme::base_colors;
export let colors = theme::colors;
export let theme_name = theme::theme;

export let eggs = #{
    alacritty: #{
        main_file: "alacritty.toml",
        targets: "~/.config/alacritty",
        templates: ["alacritty.toml"],
    },
    bat: "~/.config/bat",
    discord: #{
        strategy: "merge",
        targets: "~/.config/BetterDiscord/data/stable",
        templates: ["custom.css"],
    },
    darkman: #{
        main_file: "set-theme",
        targets: #{
            "config.yaml": "~/.config/darkman/config.yaml",
            "set-theme": "~/.local/share/darkman/set-theme",
        },
    },
    dunst: #{
        targets: "~/.config/dunst",
        templates: ["dunstrc"],
    },
    git: #{
        main_file: "config",
        targets: "~/.config/git",
        templates: ["config"],
    },
    gnupg: #{
        strategy: "merge",
        targets: "~/.gnupg",
    },
    i3: #{
        main_file: "config",
        targets: "~/.config/i3",
    },
    millennium: #{
        strategy: "merge",
        targets: "~/.config/millennium",
        templates: ["quickcss.css"],
    },
    nvim: #{
        main_file: "lua",
        targets: "~/.config/nvim",
    },
    ohmyposh: "~/.config/ohmyposh",
    picom: #{
        main_file: "picom.conf",
        targets: #{
            ".": "~/.config/picom",
            "toggle-picom": "~/bin/toggle-picom",
        },
        templates: ["picom.conf"],
    },
    polybar: #{
        main_file: "config.ini",
        targets: #{
            ".": "~/.config/polybar",
            "start-polybar": "~/bin/start-polybar",
        },
        templates: ["config.ini"],
    },
    rofi: #{
        main_file: "scripts",
        strategy: "merge",
        targets: #{
            ".": "~/.config/rofi",
            scripts: "~/bin",
        },
        templates: ["common.rasi"],
    },
    scripts: #{
        // Miscellaneous scripts that don't belong in any other egg.
        strategy: "merge",
        targets: "~/bin",
    },
    spicetify: #{
        strategy: "merge",
        targets: "~/.config/spicetify",
        templates: [
            "Themes/theme/color.ini",
            "Themes/theme/user.css",
        ],
    },
    ssh: #{
        strategy: "merge",
        targets: "~/.ssh",
    },
    tmux: #{
        main_file: "tmux.conf",
        targets: #{
            ".": "~/.config/tmux",
            sessionizer: "~/bin/sessionizer",
        },
        templates: ["tmux.conf"],
    },
    "user-dirs": #{ targets: #{ "user-dirs.dirs": "~/.config/user-dirs.dirs", }, },
    "xdg-desktop-portal": "~/.config/xdg-desktop-portal",
    "xdg-desktop-portal-termfilechooser": "~/.config/xdg-desktop-portal-termfilechooser",
    yazi: #{
        main_file: ".",
        targets: "~/.config/yazi",
    },
    "zen-browser": #{
        main_file: "myprofile/chrome/userChrome.css",
        strategy: "merge",
        targets: "~/.zen",
        templates: ["myprofile/chrome/userChrome.css"],
    },
    zsh: #{
        main_file: ".zshrc",
        targets: "~/.config/zsh",
    },
};

fn replace_rgb(color) {
    // Replaces an rgb color of the form rrr,ggg,bbb.
    let color_rgb = utils::color_hex_to_rgb(color);
    let color_str = `${color_rgb["r"]}, ${color_rgb["g"]}, ${color_rgb["b"]}`;
    let result = template::replace_re(`(\d{1,3}, ){2}\d{1,3}`, color_str);
    return result;
}

fn replace_hex_nohash(color) {
    // Replace a hex color without the preceding hash symbol.
    color.remove("#");
    let result = template::replace_re(`[0-9a-f]{6}`, color);
    return result;
}
