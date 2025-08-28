return {
  {
    "nvim-mini/mini.ai",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    opts = function()
      local textobjects = {
        a = { outer = "@attribute.outer", inner = "@attribute.inner" },
        c = { outer = "@class.outer", inner = "@class.inner" },
        C = { outer = "@comment.outer", inner = "@comment.inner" },
        e = { outer = "@assignment.outer", inner = "@assignment.rhs" },
        E = { outer = "@assignment.outer", inner = "@assignment.lhs" },
        f = { outer = "@function.outer", inner = "@function.inner" },
        F = { outer = "@call.outer", inner = "@call.inner" },
        o = { outer = "@block.outer", inner = "@block.inner" },
        O = { outer = { "@conditional.outer", "@loop.outer" }, inner = { "@conditional.inner", "@loop.inner" } },
        p = { outer = "@parameter.outer", inner = "@parameter.inner" },
        r = { outer = "@return.outer", inner = "@return.inner" },
        s = { outer = "@statement.outer", inner = "@statement.outer" },
      }

      local spec_treesitter = require("mini.ai").gen_spec.treesitter
      local custom_textobjects = {}

      for i, textobject in pairs(textobjects) do
        custom_textobjects[i] = spec_treesitter(
          { a = textobject.outer, i = textobject.inner },
          { use_nvim_treesitter = true }
        )
      end

      return {
        n_lines = 500,
        silent = true,
        custom_textobjects = custom_textobjects,
      }
    end,
  },
}
