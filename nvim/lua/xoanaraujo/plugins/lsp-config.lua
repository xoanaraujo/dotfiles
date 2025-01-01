return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "ts_ls",
                    "gopls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Ensures cmp integrates with LSP
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
        end,
    },
}
