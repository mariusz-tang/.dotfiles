vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")
-- MyLintersByFileType is set in init.lua and any exrc files.
lint.linters_by_ft = MyLintersByFileType

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    -- Only run linter in modifiable buffers.
    if vim.opt_local.modifiable:get() then
      lint.try_lint()
    end
  end,
})
