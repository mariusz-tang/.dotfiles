vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")
-- MyConformOpts is set in init.lua and any exrc files.
conform.setup(MyConformOpts)

local function format_manually()
  conform.format({ async = true, lsp_format = "fallback" })
end

vim.keymap.set("n", "<leader>f", format_manually, { desc = "Format buffer" })
