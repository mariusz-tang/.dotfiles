import "theme" as theme;

export let colors = theme::colors;
export let theme_name = theme::theme;

export let eggs = #{
    alacritty: #{
        main_file: "alacritty.toml",
        targets: "~/.config/alacritty",
        templates: ["alacritty.toml"],
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
    git: "~/.config/git",
    gnupg: #{
        strategy: "merge",
        targets: "~/.gnupg",
    },
    i3: #{
        main_file: "config",
        targets: "~/.config/i3",
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
    },
    "user-dirs": #{ targets: #{ "user-dirs.dirs": "~/.config/user-dirs.dirs", }, },
    "xdg-desktop-portal": "~/.config/xdg-desktop-portal",
    "xdg-desktop-portal-termfilechooser": "~/.config/xdg-desktop-portal-termfilechooser",
    yazi: #{
        main_file: ".",
        targets: "~/.config/yazi",
    },
    zsh: #{
        main_file: ".zshrc",
        targets: "~/.config/zsh",
    },
};
