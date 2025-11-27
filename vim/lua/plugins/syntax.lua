require("highlights.globals")
require("highlights.html")
require("highlights.php")

vim.treesitter.language.register("yaml", { "neon" })

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "blade",
      "php",
      "vue",
    },
  },
}
