vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "H", ':bprevious<CR>')
vim.keymap.set("n", "L", ':bnext<CR>')
vim.keymap.set("n", "<leader>q", ':NvimTreeToggle<CR>')

-- neotest
vim.keymap.set("n", "<leader>tn", function()
    require("neotest").run.run()
end)
vim.keymap.set("n", "<leader>tN", function()
    require("neotest").run.run({strategy = 'dap'})
end)
vim.keymap.set("n", "<leader>tl", function()
    require("neotest").run.run_last()
end)
vim.keymap.set("n", "<leader>tL", function()
    require("neotest").run.run_last({strategy = 'dap'})
end)
vim.keymap.set("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand('%'))
end)
vim.keymap.set("n", "<leader>tF", function()
    require("neotest").run.run({vim.fn.expand('%'), strategy = 'dap'})
end)
vim.keymap.set("n", "<leader>ta", function()
    require("neotest").run.attach()
end)
vim.keymap.set("n", "<leader>to", function()
    require("neotest").output.open({ enter = true })
end)
vim.keymap.set("n", "<leader>tS", function()
    require("neotest").run.stop()
end)
vim.keymap.set("n", "<leader>ts", function()
    require("neotest").summary.toggle()
end)
