return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>qx", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>qw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>qd", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>qq", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>ql", function()
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
	end,
}
