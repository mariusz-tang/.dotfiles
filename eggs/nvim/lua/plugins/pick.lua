return {
  {
    "nvim-mini/mini.pick",
    version = false,
    dependencies = { "nvim-mini/mini.icons", "nvim-mini/mini.extra" },
    opts = {
      options = {
        content_from_bottom = true,
      },
      mappings = {
        refine = "<C-r>",
      },
    },
    config = function(_, opts)
      require("mini.pick").setup(opts)

      local builtin = MiniPick.builtin
      local extra = MiniExtra.pickers

      local function search_all_files()
        builtin.cli({ command = { "rg", "--files", "-uuu", "--no-config" } })
      end

      local function search_current_buffer()
        extra.buf_lines({ scope = "current", preserve_order = true })
      end

      local function set_search_keymap(key, action, desc)
        vim.keymap.set("n", "<leader>s" .. key, action, { desc = desc })
      end

      set_search_keymap("<leader>", search_current_buffer, "Current buffer")
      set_search_keymap("F", search_all_files, "All files")
      set_search_keymap("b", builtin.buffers, "Buffers")
      set_search_keymap("f", builtin.files, "Files")
      set_search_keymap("g", builtin.grep_live, "Live grep")
      set_search_keymap("G", builtin.grep, "Static grep")
      set_search_keymap("h", builtin.help, "Help")
      set_search_keymap("r", builtin.resume, "Resume latest picker")
      set_search_keymap("c", extra.git_commits, "Commits")
      set_search_keymap("C", extra.commands, "Commands")
      set_search_keymap("d", extra.diagnostic, "Diagnostics")
      set_search_keymap("k", extra.keymaps, "Keymaps")
      set_search_keymap("o", extra.options, "Options")
      set_search_keymap("R", extra.registers, "Registers")
    end,
  },
}
