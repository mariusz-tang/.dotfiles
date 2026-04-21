vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })
require("gruvbox").setup({
  overrides = {
    SignColumn = { bg = "none" },
  },
})
vim.cmd.colorscheme("gruvbox")

vim.api.nvim_create_autocmd("OptionSet", {
  group = vim.api.nvim_create_augroup("colorscheme", { clear = true }),
  pattern = "background",
  callback = function()
    -- Continue the cursorline into the sign column.
    vim.cmd("highlight link CursorLineSign CursorLine")

    -- Remove background fill from diagnostic signs.
    vim.cmd("highlight link DiagnosticSignError DiagnosticError")
    vim.cmd("highlight link DiagnosticSignHint DiagnosticHint")
    vim.cmd("highlight link DiagnosticSignInfo DiagnosticInfo")
    vim.cmd("highlight link DiagnosticSignOk DiagnosticOk")
    vim.cmd("highlight link DiagnosticSignWarn DiagnosticWarn")

    -- Make the diff-colored line numbers bold.
    vim.cmd("highlight link MiniDiffSignAdd GruvboxGreenBold")
    vim.cmd("highlight link MiniDiffSignChange GruvboxAquaBold")
    vim.cmd("highlight link MiniDiffSignDelete GruvboxRedBold")

    -- Make treesitter context lines highlight over the number column.
    vim.cmd("highlight link TreesitterContextLineNumber TreesitterContext")
  end,
})
