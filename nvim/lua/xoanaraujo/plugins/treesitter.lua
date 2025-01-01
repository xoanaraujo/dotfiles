return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            sync_install = false,
            auto_install = false,
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "typescript",
                "go",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
