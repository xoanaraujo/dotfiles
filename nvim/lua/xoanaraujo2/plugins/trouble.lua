return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup {
            virtual_text = true,
            height = 10, -- Adjust for screen fit
            auto_close = true,
        }
        -- Keybinding to toggle diagnostics
        vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true })
    end
}

