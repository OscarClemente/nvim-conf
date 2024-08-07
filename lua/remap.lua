-- Buffer movements
vim.keymap.set("n", "H", ":bprevious<CR>")
vim.keymap.set("n", "L", ":bnext<CR>")
vim.keymap.set("n", "<leader>b", ":BufDel<CR>")
vim.keymap.set("n", "<leader>B", ":BufDelOthers<CR>")
vim.keymap.set("n", "<leader>F", function()
	vim.lsp.buf.format({ async = true })
end, {})

-- QuickFix list
vim.keymap.set("n", "<leader>sc", ":cclose<CR>")
vim.keymap.set("n", "<leader>so", ":copen<CR>")
vim.keymap.set("n", "<leader>j", ":cn<CR>")
vim.keymap.set("n", "<leader>k", ":cp<CR>")
vim.keymap.set("n", "<leader>sh", ":col<CR>")
vim.keymap.set("n", "<leader>sn", ":cnew<CR>")

-- Window movements
--vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
--vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
--vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
--vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- neotest
vim.keymap.set("n", "<leader>tn", function()
	require("neotest").run.run()
end)
vim.keymap.set("n", "<leader>tN", function()
	require("neotest").run.run({ strategy = "dap" })
end)
vim.keymap.set("n", "<leader>tl", function()
	require("neotest").run.run_last()
end)
vim.keymap.set("n", "<leader>tL", function()
	require("neotest").run.run_last({ strategy = "dap" })
end)
vim.keymap.set("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>tF", function()
	require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
end)
vim.keymap.set("n", "<leader>ta", function()
	require("neotest").run.attach()
end)
vim.keymap.set("n", "<leader>to", function()
	require("neotest").output.open({ enter = false })
end)
vim.keymap.set("n", "<leader>tS", function()
	require("neotest").run.stop()
end)
vim.keymap.set("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end)
