return {
  {
    "echasnovski/mini.starter",
    version = false,
    opts = function()
      local sections = require("mini.starter").sections
      return {
        items = {
          sections.recent_files(5, true),
          sections.builtin_actions(),
        },
      }
    end,
  },
}
