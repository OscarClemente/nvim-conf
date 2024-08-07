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
				ensure_installed = { "lua_ls", "tsserver", "gopls", "rust_analyzer", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			local opts = {}
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Mapped in trouble.lua
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- Mapped in trouble.lua
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			--vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- Mapped in trouble.lua
			--vim.keymap.set("n", "<leader>f", function()
			--	vim.lsp.buf.format({ async = true })
			--end, opts)
		end,
	},
}
