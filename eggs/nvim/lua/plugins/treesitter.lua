return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "LiadOz/nvim-dap-repl-highlights", opts = {} },
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local languages = {
        -- Vim
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        -- Git
        "diff",
        "gitattributes",
        "gitcommit",
        "git_config",
        "gitignore",
        "git_rebase",
        -- Markdown
        "markdown",
        "markdown_inline",
        -- Debugger REPL
        "dap_repl",
        -- Other
        "editorconfig",
        "tmux",
        -- Manually install other language parsers.
      }
      local ts = require("nvim-treesitter")
      ts.install(languages):wait(30000)
      ts.update():wait(30000)

      vim.keymap.set("n", "<leader>ts", vim.treesitter.start, { desc = "Start" })
      vim.keymap.set("n", "<leader>tS", vim.treesitter.stop, { desc = "Stop" })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
        callback = function(event)
          local filetype = event.match

          local excluded = {
            "checkhealth",
            "csv",
            "dap-view",
            "dap-view-term",
            "dap-repl", -- The dap repl highlight plugin will enable highlights automatically.
            "lazy",
            "lazy_backdrop",
            "minifiles",
            "mininotify",
            "minipick",
            "netrw",
            "rhai",
            "text",
          }
          for _, language in ipairs(excluded) do
            if filetype == language then
              return
            end
          end

          if pcall(vim.treesitter.start) then
            vim.treesitter.start() -- Syntax highlighting.
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          else
            print("Could not start treesitter for language '" .. filetype .. "'. Is there a parser installed?")
          end
        end,
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", opts = { enabled = true, max_lines = 5 } },
  { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main", lazy = true },
  { "windwp/nvim-ts-autotag", opts = {} },
}
