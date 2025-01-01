return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup {
      height = 10, -- Make it fit within the screen
      auto_close = true,
    }
  end
}

