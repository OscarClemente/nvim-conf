return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("dapui").setup()
			require("dap-go").setup()

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
			vim.keymap.set("n", "<Leader>dq", ":DapTerminate<CR>")
			vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
			vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
			vim.keymap.set("n", "<Leader>du", ":DapStepOut<CR>")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({

				automatic_setup = true,
				ensure_installed = { "python", "delve", "codelldb" },

				handlers = {
					function(config)
						-- all sources with no handler get passed here
						local dap = require("dap")

						dap.adapters["pwa-node"] = {
							type = "server",
							host = "127.0.0.1",
							port = 8123,
							executable = {
								command = "js-debug-adapter",
							},
						}
						for _, language in ipairs({ "typescript", "javascript" }) do
							dap.configurations[language] = {
								{
									type = "pwa-node",
									request = "launch",
									name = "Launch file",
									program = "${file}",
									cwd = "${workspaceFolder}",
									runtimeExecutable = "node",
								},
							}
						end

						-- Keep original functionality
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
}
