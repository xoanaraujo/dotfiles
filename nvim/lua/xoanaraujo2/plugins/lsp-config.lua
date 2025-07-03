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
					"zls",
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
			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.cmake_language_server.setup({capabilities = capabilities})
			lspconfig.cmakelang.setup({capabilities = capabilities})
			lspconfig.cmakelint.setup({capabilities = capabilities})

			local function goto_location_in_new_tab(_, result, ctx, config)
				if result == nil or vim.tbl_isempty(result) then
					vim.notify("Location not found", vim.log.levels.WARN)
					return
				end

				-- Convert result to a list if it isn't already
				if not vim.islist(result) then
					result = { result }
				end

				-- Open a new tab
				vim.cmd("tabnew")

				-- Jump to the first location in the new tab
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.jump_to_location(result[1], client.offset_encoding, config and config.reuse_win or false)
			end
			-- Override the handlers for definition and declaration
			vim.lsp.handlers["textDocument/definition"] = goto_location_in_new_tab
			vim.lsp.handlers["textDocument/declaration"] = goto_location_in_new_tab
			vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
		end,
	},
}
