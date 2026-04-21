-- Disable linting since we're using ruff instead.
return {
  settings = {
    pylsp = {
      plugins = {
        mccabe = { enabled = false },
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
      },
    },
  },
}
