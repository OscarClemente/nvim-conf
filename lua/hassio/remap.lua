vim.g.mapleader = " "

-- Buffer movements
vim.keymap.set("n", "H", ':bprevious<CR>')
vim.keymap.set("n", "L", ':bnext<CR>')
vim.keymap.set("n", "<leader>q", ':NvimTreeToggle<CR>')
vim.keymap.set("n", "<leader>c", ':Bdelete!<CR>')
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)

-- Window movements
vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')

-- neotest
vim.keymap.set("n", "<leader>tn", function()
    require("neotest").run.run()
end)
vim.keymap.set("n", "<leader>tN", function()
    require("neotest").run.run({ strategy = 'dap' })
end)
vim.keymap.set("n", "<leader>tl", function()
    require("neotest").run.run_last()
end)
vim.keymap.set("n", "<leader>tL", function()
    require("neotest").run.run_last({ strategy = 'dap' })
end)
vim.keymap.set("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand('%'))
end)
vim.keymap.set("n", "<leader>tF", function()
    require("neotest").run.run({ vim.fn.expand('%'), strategy = 'dap' })
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

-- lspsaga
local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({"n","v"}, "<leader>la", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gR", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>el", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>eb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>ew", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>ec", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "<leader>ep", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "<leader>en", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "<leader>eP", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "<leader>eN", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"

-- Call hierarchy
keymap("n", "<leader>li", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<leader>lo", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({"n", "t"}, "<leader>T", "<cmd>Lspsaga term_toggle<CR>")
