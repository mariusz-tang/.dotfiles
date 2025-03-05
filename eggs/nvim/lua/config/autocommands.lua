-- Highlight when yanking text.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

-- Set tab title.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function(event)
    local title = "nvim"
    if event.file ~= "" then
      title = string.format("nvim: %s", vim.fs.basename(event.file))
    end

    vim.fn.system({ "wezterm", "cli", "set-tab-title", title })
  end,
})
