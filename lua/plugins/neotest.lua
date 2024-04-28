return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-go",
		"haydenmeade/neotest-jest",
		"nvim-neotest/neotest-vim-test",
		"rouge8/neotest-rust",
	},
	config = function()
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					-- Replace newline and tab characters with space for more compact diagnostics
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "unittest",
				}),
				require("neotest-jest"),
				require("neotest-go"),
				require("neotest-plenary"),
				require("neotest-rust"),
				require("neotest-vim-test")({
					ignore_file_types = { "python", "vim", "lua", "go", "rust" },
				}),
			},
			status = { virtual_text = true },
		})
	end,
}
