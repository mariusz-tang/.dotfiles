export let eggs = #{
    git: "~/.config/git",
    i3: "~/.config/i3",
    nvim: "~/.config/nvim",
    polybar: #{
	targets: #{
	    "./polybar": "~/.config/polybar",
	    bin: "~/bin",
	},
	strategy: "merge",
    },
    shell: #{
	targets: #{ zsh: "~/.config/zsh", bin: "~/bin", ohmyposh: "~/.config/ohmyposh" },
	strategy: "merge",
    },
    ssh: #{ targets: "~/.ssh", strategy: "merge"},
    "user-dirs": #{
	targets: "~/.config",
	strategy: "merge",
    },
};
