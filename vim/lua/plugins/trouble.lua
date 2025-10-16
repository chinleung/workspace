return {
  "folke/trouble.nvim",
  opts = function(_, opts)
    local Text = require("trouble.view.text")
    local original_statusline = Text.statusline

    Text.statusline = function(self, statusline_opts)
      statusline_opts = statusline_opts or {}
      statusline_opts.sep = "%#lualine_c_normal# > %*"

      return original_statusline(self, statusline_opts):gsub("(%%#lualine_c_normal# > %%%*)%s*$", "")
    end

    return opts
  end,
}
