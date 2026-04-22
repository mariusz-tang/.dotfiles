return {
  settings = {
    pylsp = {
      plugins = {
        -- Enable pylsp-rope plugin.
        rope_rename = { enabled = true },
        -- Rope is noticeably faster than jedi.
        rope_completion = { enabled = true },
        jedi_completion = { enabled = false },
      },
    },
  },
}
