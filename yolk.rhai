export let eggs = #{
    alacritty: "~/.config/alacritty",
    autorandr: #{
        targets: "~/.config/autorandr/",
        strategy: "merge",
    },
    darkman: #{
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
    i3: "~/.config/i3",
    lock: #{
        targets: "~/bin",
        strategy: "merge",
    },
    "media-control": #{
        targets: "~/bin",
        strategy: "merge",
    },
    nvim: "~/.config/nvim",
    picom: #{
        targets: #{
            picom: "~/.config/picom",
            bin: "~/bin",
        },
        strategy: "merge",
    },
    polybar: #{
        targets: #{
            polybar: "~/.config/polybar",
            bin: "~/bin",
        },
        strategy: "merge",
    },
    rofi: #{
        targets: #{
            bin: "~/bin",
            config: "~/.config/rofi"
        },
        strategy: "merge",
    },
    shell: #{
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
    yazi: "~/.config/yazi",
};
