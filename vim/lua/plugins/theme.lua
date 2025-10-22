-- Custom adjustments
vim.cmd("hi GruvboxRedUnderline gui=underline")

-- Diagnostics
vim.cmd("hi link DiagnosticInfo GruvboxAqua")
vim.cmd("hi link DiagnosticFloatingInfo GruvboxAqua")
vim.cmd("hi link DiagnosticVirtualTextInfo GruvboxAqua")
vim.cmd("hi link DiagnosticHint GruvboxBlue")
vim.cmd("hi link DiagnosticFloatingHint GruvboxBlue")
vim.cmd("hi link DiagnosticVirtualTextHint GruvboxBlue")

-- Trouble
vim.cmd("hi TroubleStatusline2 guibg=#3c3836")

return {
  "ellisonleao/gruvbox.nvim",
  opts = {
    overrides = {
      Conceal = {
        fg = "#ebdbb2",
      },
      CursorLineNr = {
        bg = "#282828",
      },
      GruvboxAquaSign = {
        bg = "#282828",
      },
      GruvboxRedSign = {
        bg = "#282828",
      },
      GruvboxWhite = {
        bg = "#282828",
        fg = "#ebdbb2",
      },
      GruvboxYellowSign = {
        bg = "#282828",
      },
      NormalFloat = {
        bg = "#3c3836",
      },
      SignColumn = {
        bg = "#282828",
      },
      TabLineFill = {
        bg = "#282828",
      },
      TabLineSel = {
        fg = "#fabd2f",
        bg = "#282828",
        bold = true,
      },
    },
  },
}
