_G.my_action = function(selected, opts)
	-- code from `actions.file_sel_to_qf`
	local qf_list = {}
	for i = 1, #selected do
		local file = require("fzf-lua").path.entry_to_file(selected[i])
		local text = selected[i]:match(":%d+:%d?%d?%d?%d?:?(.*)$")
		table.insert(qf_list, {
			filename = file.path,
			lnum = file.line,
			col = file.col,
			text = text,
		})
	end
	-- this sets the quickfix list, you may or may not need it for 'trouble.nvim'
	vim.fn.setqflist(qf_list)
	-- call the command to open the 'trouble.nvim' interface
	require("trouble").open("quickfix")
end

return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({
				files = {
					actions = { ["ctrl-q"] = { fn = _G.my_action, prefix = "select-all+" } },
				},
				live_grep = {
					actions = { ["ctrl-q"] = { fn = _G.my_action, prefix = "select-all+" } },
				},
				grep = {
					actions = { ["ctrl-q"] = { fn = _G.my_action, prefix = "select-all+" } },
				},
			})
			vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")
			vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>")
			vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>")
		end,
	},
	{ "junegunn/fzf", build = "./install --bin" },
}
-- ff files
-- fq quickfix
-- fg grep/live_grep?
-- fci calls in
-- fco calls out
