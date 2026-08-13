-- LSP ------------------------------------------------------------------------
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-- Some servers require snippet support to provide completions.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- MyLsps is set in init.lua and any exrc files.
vim.lsp.enable(MyLsps)

local document_symbols = function()
  require("mini.extra").pickers.lsp({ scope = "document_symbol" })
end

local workspace_symbols = function()
  require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
end

vim.keymap.set("n", "grs", document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "grw", workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Variable definition" })

-- C/C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.keymap.set(
      "n",
      "<leader>c",
      "<cmd>LspClangdSwitchSourceHeader<cr>",
      { desc = "Switch between source and header files" }
    )
  end,
})

-- LAZYDEV --------------------------------------------------------------------
vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
require("lazydev").setup({
  library = {
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})
