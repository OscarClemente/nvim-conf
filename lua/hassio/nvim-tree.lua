local function open_nvim_tree(data)
    local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")

    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"
    
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
    
      -- default mappings
      api.config.mappings.default_on_attach(bufnr)
    
      -- custom mappings
      vim.keymap.set('n', 'h',     api.tree.collapse_all,                 opts('Collapse'))
      vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Open'))
    end

    require("nvim-tree").setup {
        on_attach = my_on_attach,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        renderer = {
            root_folder_modifier = ":t",
            icons = {
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "U",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        view = {
            width = 30,
            side = "left",
        },
    }

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
