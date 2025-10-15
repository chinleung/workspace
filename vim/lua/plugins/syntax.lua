require("highlights.globals")
require("highlights.html")
require("highlights.php")

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
