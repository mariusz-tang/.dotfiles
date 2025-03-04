export let eggs = #{
    ssh: #{ targets: "~/.ssh", strategy: "merge"},
    git: "~/.config/git",
    shell: #{
	targets: #{ zsh: "~/.config/zsh", bin: "~/bin", ohmyposh: "~/.config/ohmyposh" },
	strategy: "merge",
    },
};
