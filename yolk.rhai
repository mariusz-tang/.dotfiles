export let eggs = #{
    darkman: #{
        targets: #{
            darkman: "~/.config/darkman",
            lightmode: "~/.local/share/light-mode.d",
            darkmode: "~/.local/share/dark-mode.d",
            bin: "~/bin",
        },
        strategy: "merge",
    },
    dunst: "~/.config/dunst",
    firefox: #{
        targets: "~/.mozilla/firefox",
        strategy: "merge",
    },
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
    rofi: "~/.config/rofi",
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
    "user-dirs": #{
        targets: "~/.config",
        strategy: "merge",
    },
    wezterm: "~/.config/wezterm",
    "xdg-desktop-portal": "~/.config/xdg-desktop-portal",
};
