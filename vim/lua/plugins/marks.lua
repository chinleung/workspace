return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>sm",
      function()
        Snacks.picker.marks({
          transform = function(item)
            if item.file:find(vim.loop.cwd()) then
              return true
            end

            return false
          end,
        })
      end,
      desc = "Marks",
    },
  },
}
