export let eggs = #{
    git: "~/.config/git",
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
