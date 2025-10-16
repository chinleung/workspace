return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Remove unused components
    for i = 1, 6 do
      table.remove(opts.sections.lualine_x, 1)
    end

    -- Fix the background colour in insert mode
    local theme = require("lualine.themes.gruvbox")
    theme.insert.c.bg = "#3c3836"
    opts.options.theme = theme

    return opts
  end,
}
