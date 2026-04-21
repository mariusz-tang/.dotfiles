vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/igorlfs/nvim-dap-view",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://codeberg.org/mfussenegger/nvim-dap-python",
})

-- NVIM DAP -------------------------------------------------------------------
local dap = require("dap")
require("dap-python").setup("/usr/sbin/python")
dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"

if SetupDap then
  SetupDap(dap)
end

-- NVIM DAP VIEW --------------------------------------------------------------
local dap_view = require("dap-view")
dap_view.setup({
  winbar = {
    show_keymap_hints = false,
  },
  windows = {
    size = 0.3,
    terminal = { position = "right" },
  },
  auto_toggle = true,
})

-- NVIM DAP VIRTUAL TEXT ------------------------------------------------------
require("nvim-dap-virtual-text").setup({ highlight_new_as_changed = true })

-- KEYMAPS --------------------------------------------------------------------
local function terminate_session()
  dap.terminate()
  dap_view.close(true)
  vim.cmd(":DapVirtualTextForceRefresh")
end

local function toggle_dap_view()
  dap_view.toggle(true)
end

local function watch_expression_interactive()
  dap_view.add_expr(vim.fn.input("Watch expression: "))
end

local function set_log_point()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end

-- Keymaps for jumping to dap-view windows.

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dl", set_log_point, { desc = "Set log point" })

vim.keymap.set("n", "<leader>dt", toggle_dap_view, { desc = "Toggle debug windows" })
vim.keymap.set("n", "<leader>dT", terminate_session, { desc = "Terminate session" })
vim.keymap.set("n", "<leader>dw", dap_view.add_expr, { desc = "Watch expression under cursor" })
vim.keymap.set("n", "<leader>dW", watch_expression_interactive, { desc = "Watch expression (interactive)" })
vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dC", dap.goto_, { desc = "Jump to cursor" })
