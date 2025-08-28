return {
  {
    "nvim-mini/mini.pick",
    version = false,
    dependencies = { "nvim-mini/mini.icons", "nvim-mini/mini.extra" },
    opts = {
      mappings = {
        paste = "<C-P>",
        refine = "<C-r>",
      },
    },
    config = function(_, opts)
      require("mini.pick").setup(opts)

      local function set_search_keybind(key, action, desc)
        vim.keymap.set("n", "<leader>s" .. key, action, { desc = desc })
      end

      local builtin = MiniPick.builtin
      set_search_keybind("b", builtin.buffers, "Buffers")
      set_search_keybind("f", builtin.files, "Files")
      set_search_keybind("F", function()
        builtin.cli({ command = { "rg", "--no-ignore", "--hidden", "--files" } })
      end, "All files")
      set_search_keybind("g", builtin.grep_live, "Live grep")
      set_search_keybind("G", builtin.grep, "Static grep")
      set_search_keybind("h", builtin.help, "Help")
      set_search_keybind("r", builtin.resume, "Resume latest picker")

      local extra = MiniExtra.pickers
      set_search_keybind("<leader>", function()
        extra.buf_lines({ scope = "current", preserve_order = true })
      end, "Current buffer")
      set_search_keybind("C", extra.commands, "Commands")
      set_search_keybind("d", extra.diagnostic, "Diagnostics")
      set_search_keybind("c", extra.git_commits, "Commits")
      set_search_keybind("k", extra.keymaps, "Keymaps")
      set_search_keybind("o", extra.options, "Options")
      set_search_keybind("R", extra.registers, "Registers")
    end,
  },
}
