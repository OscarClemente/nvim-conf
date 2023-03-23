vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim-test
vim.keymap.set("n", "<leader>tn", function()
    vim.cmd("TestNearest")
end)
vim.keymap.set("n", "<leader>tf", function()
    vim.cmd("TestFile")
end)
vim.keymap.set("n", "<leader>ts", function()
    vim.cmd("TestSuite")
end)
vim.keymap.set("n", "<leader>tl", function()
    vim.cmd("TestLast")
end)
vim.keymap.set("n", "<leader>tv", function()
    vim.cmd("TestVisit")
end)
