export let eggs = #{
    alacritty: #{
        main_file: "alacritty.toml",
        targets: "~/.config/alacritty",
    },
    autorandr: #{
        targets: "~/.config/autorandr/",
        strategy: "merge",
    },
    darkman: #{
        main_file: "scripts/set-theme.sh",
        targets: #{
            darkman: "~/.config/darkman",
            scripts: "~/.local/share/darkman",
            bin: "~/bin",
        },
        strategy: "merge",
    },
    dunst: "~/.config/dunst",
    git: "~/.config/git",
    gnupg: #{
        targets: "~/.gnupg",
        strategy: "merge",
    },
    i3: #{
        main_file: "config",
        targets: "~/.config/i3",
    },
    lock: #{
        targets: "~/bin",
        strategy: "merge",
    },
    "media-control": #{
        targets: "~/bin",
        strategy: "merge",
    },
    nvim: #{
        main_file: "lua",
        targets: "~/.config/nvim",
    },
    picom: #{
        main_file: "picom/picom.conf",
        targets: #{
            picom: "~/.config/picom",
            bin: "~/bin",
        },
        strategy: "merge",
    },
    polybar: #{
        main_file: "polybar/config.ini",
        targets: #{
            polybar: "~/.config/polybar",
            bin: "~/bin",
        },
        strategy: "merge",
    },
    rofi: #{
        main_file: "bin",
        targets: #{
            bin: "~/bin",
            config: "~/.config/rofi"
        },
        strategy: "merge",
    },
    shell: #{
        main_file: "zsh/.zshrc",
        targets: #{
            zsh: "~/.config/zsh",
            bin: "~/bin",
            ohmyposh: "~/.config/ohmyposh"
        },
        strategy: "merge",
    },
    ssh: #{
        targets: "~/.ssh",
        strategy: "merge"
    },
    tmux: #{
        main_file: "tmux/tmux.conf",
        targets:#{
            tmux: "~/.config/tmux",
            sessionizer: "~/bin/sessionizer"
        },
    },
    "user-dirs": #{
        targets: "~/.config",
        strategy: "merge",
    },
    "xdg-desktop-portal": "~/.config/xdg-desktop-portal",
    "xdg-desktop-portal-termfilechooser": "~/.config/xdg-desktop-portal-termfilechooser",
    yazi: #{
        main_file: ".",
        targets: "~/.config/yazi",
    },
};
