export let eggs = #{
    git: "~/.config/git",
    i3: "~/.config/i3",
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
