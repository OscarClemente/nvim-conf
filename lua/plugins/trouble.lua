return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xq", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").toggle("loclist")
		end)
		vim.keymap.set("n", "gr", function()
			require("trouble").toggle("lsp_references")
		end)
		vim.keymap.set("n", "gi", function()
			require("trouble").toggle("lsp_implementations")
		end)
		vim.keymap.set("n", "gd", function()
			require("trouble").toggle("lsp_definitions")
		end)

		--local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-q>"] = trouble.open_with_trouble },
					n = { ["<c-q>"] = trouble.open_with_trouble },
				},
			},
		})
	end,
}
