export let eggs = #{
    alacritty: #{
        main_file: "alacritty.toml",
        targets: "~/.config/alacritty",
    },
    autorandr: #{
        strategy: "merge",
        targets: "~/.config/autorandr/",
    },
    darkman: #{
        main_file: "scripts/set-theme.sh",
        strategy: "merge",
        targets: #{
            bin: "~/bin",
            darkman: "~/.config/darkman",
            scripts: "~/.local/share/darkman",
        },
    },
    dunst: "~/.config/dunst",
    git: "~/.config/git",
    gnupg: #{
        strategy: "merge",
        targets: "~/.gnupg",
    },
    i3: #{
        main_file: "config",
        targets: "~/.config/i3",
    },
    lock: #{
        strategy: "merge",
        targets: "~/bin",
    },
    "media-control": #{
        strategy: "merge",
        targets: "~/bin",
    },
    nvim: #{
        main_file: "lua",
        targets: "~/.config/nvim",
    },
    picom: #{
        main_file: "picom/picom.conf",
        strategy: "merge",
        targets: #{
            bin: "~/bin",
            picom: "~/.config/picom",
        },
    },
    polybar: #{
        main_file: "polybar/config.ini",
        strategy: "merge",
        targets: #{
            bin: "~/bin",
            polybar: "~/.config/polybar",
        },
    },
    rofi: #{
        main_file: "bin",
        strategy: "merge",
        targets: #{
            bin: "~/bin",
            config: "~/.config/rofi",
        },
    },
    shell: #{
        main_file: "zsh/.zshrc",
        strategy: "merge",
        targets: #{
            bin: "~/bin",
            ohmyposh: "~/.config/ohmyposh",
            zsh: "~/.config/zsh",
        },
    },
    ssh: #{
        strategy: "merge",
        targets: "~/.ssh",
    },
    tmux: #{
        main_file: "tmux/tmux.conf",
        targets:#{
            sessionizer: "~/bin/sessionizer",
            tmux: "~/.config/tmux",
        },
    },
    "user-dirs": #{
        strategy: "merge",
        targets: "~/.config",
    },
    "xdg-desktop-portal": "~/.config/xdg-desktop-portal",
    "xdg-desktop-portal-termfilechooser": "~/.config/xdg-desktop-portal-termfilechooser",
    yazi: #{
        main_file: ".",
        targets: "~/.config/yazi",
    },
};
