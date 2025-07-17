return {
  {
    "echasnovski/mini.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("mini.cursorword").setup()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.starter").setup()
      require("mini.statusline").setup()

      local custom_textobjects = {
        a = { outer = "@attribute.outer", inner = "@attribute.inner" },
        c = { outer = "@comment.outer", inner = "@comment.inner" },
        C = { outer = "@class.outer", inner = "@class.inner" },
        e = { outer = "@assignment.outer", inner = "@assignment.rhs" },
        E = { outer = "@assignment.outer", inner = "@assignment.lhs" },
        f = { outer = "@call.outer", inner = "@call.inner" },
        F = { outer = "@function.outer", inner = "@function.inner" },
        o = { outer = "@block.outer", inner = "@block.inner" },
        O = { outer = { "@conditional.outer", "@loop.outer" }, inner = { "@conditional.inner", "@loop.inner" } },
        p = { outer = "@parameter.outer", inner = "@parameter.inner" },
        r = { outer = "@return.outer", inner = "@return.inner" },
        s = { outer = "@statement.outer", inner = "@statement.outer" },
      }

      local ai = require("mini.ai")
      local surround = require("mini.surround")
      local spec_treesitter = ai.gen_spec.treesitter
      local ts_input = surround.gen_spec.input.treesitter
      local custom_textobjects_ai = {}
      local custom_textobjects_surround = {}

      for i, textobject in pairs(custom_textobjects) do
        custom_textobjects_ai[i] = spec_treesitter(
          { a = textobject.outer, i = textobject.inner },
          { use_nvim_treesitter = true }
        )
        if i ~= "O" then
          custom_textobjects_surround[i] = ts_input(textobject, { use_nvim_treesitter = true })
        end
      end

      ai.setup({
        n_lines = 500,
        silent = true,
        custom_textobjects = custom_textobjects_ai,
      })
      surround.setup({ custom_textobjects = custom_textobjects_surround })
    end,
  },
}
