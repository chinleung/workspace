return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "K", false },
          {
            "D",
            function()
              return vim.lsp.buf.hover()
            end,
            desc = "Hover",
          },
        },
      },
    },
  },
}
