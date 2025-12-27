return {
  {
    "igorlfs/nvim-dap-view",
    opts = {
      winbar = {
        base_sections = {
          -- Remove keybind indicators from the labels.
          breakpoints = {
            label = "Breakpoints",
            short_label = "",
          },
          scopes = {
            label = "Scopes",
            short_label = "󰂥",
          },
          exceptions = {
            label = "Exceptions",
            short_label = "󰢃",
          },
          watches = {
            label = "Watches",
            short_label = "󰛐",
          },
          threads = {
            label = "Threads",
            short_label = "󱉯",
          },
          repl = {
            label = "REPL",
            short_label = "󰯃",
          },
        },
      },
      windows = {
        height = 0.3,
        terminal = { position = "right" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dap_view = require("dap-view")

      local function terminate_session()
        dap.terminate()
        dap_view.close(true)
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

      local function set_dap_keymap(key, action, desc)
        vim.keymap.set({ "n" }, "<leader>d" .. key, action, { desc = desc })
      end

      -- Keymaps for jumping to dap-view windows.
      local function set_dap_jump_keymap(key, window_name)
        local function action()
          -- Make sure dap-view is open.
          dap_view.open()
          dap_view.jump_to_view(string.lower(window_name))
        end
        set_dap_keymap("j" .. key, action, window_name)
      end

      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)
      set_dap_keymap("T", terminate_session, "Terminate session")
      set_dap_keymap("t", toggle_dap_view, "Toggle debug windows")
      set_dap_keymap("w", dap_view.add_expr, "Watch expression under cursor")
      set_dap_keymap("W", watch_expression_interactive, "Watch expression (interactive)")
      set_dap_keymap("b", dap.toggle_breakpoint, "Toggle breakpoint")
      set_dap_keymap("l", set_log_point, "Set logpoint")
      set_dap_jump_keymap("r", "Repl")
      set_dap_jump_keymap("s", "Scopes")
      set_dap_jump_keymap("b", "Breakpoints")
      set_dap_jump_keymap("t", "Threads")
      set_dap_jump_keymap("e", "Exceptions")
      set_dap_jump_keymap("w", "Watches")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = { handlers = {} },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = { highlight_new_as_changed = true },
  },
}
