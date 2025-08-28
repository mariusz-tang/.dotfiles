return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-mini/mini.completion",
      "nvim-mini/mini.pick",
      "nvim-mini/mini.extra",
      "nvim-mini/mini.notify",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local function set_lsp_keybind(key, action, desc, modes)
            modes = modes or { "n" }
            vim.keymap.set(modes, "<leader>l" .. key, action, { buffer = event.buf, desc = desc })
          end

          local lsp_picker = function(scope)
            local function open_picker()
              require("mini.extra").pickers.lsp({ scope = scope })
            end
            return open_picker
          end

          set_lsp_keybind("d", lsp_picker("definition"), "Definition")
          set_lsp_keybind("R", lsp_picker("references"), "References")
          set_lsp_keybind("i", lsp_picker("implementation"), "Implementation")
          set_lsp_keybind("t", lsp_picker("type_definition"), "Type definition")
          set_lsp_keybind("s", lsp_picker("document_symbol"), "Document symbols")
          set_lsp_keybind("w", lsp_picker("workspace_symbol"), "Workspace symbols")
          set_lsp_keybind("r", vim.lsp.buf.rename, "Rename")
          set_lsp_keybind("a", vim.lsp.buf.code_action, "Code action", { "n", "v" })
          set_lsp_keybind("h", function()
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
            vim.lsp.inlay_hint.enable(not enabled)
          end, "Toggle inlay hints")
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

      for server, config in pairs(ProjectSettings.lsps) do
        config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})

        vim.lsp.enable(server)
        vim.lsp.config(server, config)
      end
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
