local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "" .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- This loads all the default mappings (like Ctrl-] and -)
    api.config.mappings.default_on_attach(bufnr)

    -- Add your custom leader mapping here
    vim.keymap.set('n', '<leader>ed', api.tree.change_root_to_node, opts('Change Root to chosen folder'))
    vim.keymap.set('n', '<leader>eD', api.tree.change_root_to_parent, opts('Change Root to one folder up'))
end

-------------------------
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwplugin = 1

        nvimtree.setup({
            sync_root_with_cwd = true, -- Changes tree root when you :cd
            respect_buf_cwd = true,    -- Respects the CWD of the buffer
            update_focused_file = {
                enable = true,         -- Automatically expands the tree to the current file
                update_root = true,    -- Changes the tree root if you enter a different project
            },
            view = {
                width = 35,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
            on_attach = my_on_attach,
        })


        -- set keymaps
        local keymap = vim.keymap
        keymap.set("n", "<leader>er", "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" })                                          -- toggle file explorer on current file
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
        keymap.set("n", "<leader>es", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })   -- refresh file explorer
        keymap.set("n", "<leader>eq", "<cmd>NvimTreeClose<CR>", { desc = "Close file explorer" })       -- refresh file explorer
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in tree" })
    end
}
