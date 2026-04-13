vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap

-- Plugin bindings
--vim.keymap.set('n', '<F2>', ':TagbarToggle<CR>')
--vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
--vim.keymap.set('n', '<C-c>', ':Commentary<CR>', { noremap = true, silent = true })
-- Save all and quit Neovim
keymap.set("n", "<leader>qf", ":wa | qa!<CR>", { desc = "Force save all and quit" })
keymap.set("n", "<leader>qs", ":wa<CR>", { desc = "Save all buffers" })

-- Window resizing
keymap.set("n", "<C-S-l>", "<cmd>vertical resize -3<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-S-h>", "<cmd>vertical resize +3<CR>", { desc = "Increase window width" })
keymap.set("n", "<C-S-j>", "<cmd>resize -3<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-S-k>", "<cmd>resize +3<CR>", { desc = "Increase window height" })

-- WinShift window move
keymap.set("n", "<leader>ww", "<cmd>WinShift<CR>", { desc = "Enter WinShift mode (hjkl to move window)" })
keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize window sizes" })
keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all OTHER windows" })
local function move_window_to_tab(direction)
    local curr_buf = vim.api.nvim_get_current_buf()
    local curr_win = vim.api.nvim_get_current_win()

    vim.cmd("close")

    if direction == "next" then
        vim.cmd("tabnext")
    else
        vim.cmd("tabprevious")
    end

    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(curr_buf)
end
keymap.set("n", "<leader>wh", function() move_window_to_tab("prev") end, { desc = "Teleport window to prev tab" })
keymap.set("n", "<leader>wl", function() move_window_to_tab("next") end, { desc = "Teleport window to next tab" })
keymap.set("n", "<leader>wt", "<C-w>T", { desc = "Break window out to new tab" })

-- Navigating between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to the right window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to the upper window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to the lower window" })

-- Key mappings for splits
keymap.set("n", "<M-,>", "<CMD>vsplit<CR>", { desc = "Split the window vertically (left-right)" })
keymap.set("n", "<M-.>", "<CMD>split<CR>", { desc = "Split the window horizontally (top-bottom)" })

-- Tabs
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open a new empty tab" })
keymap.set("n", "<leader>tm", "<cmd>tabnew %<CR>", { desc = "Open a copy of the current tab" })
keymap.set("n", "<leader>te", "<cmd>tabnew | terminal<CR>i", { desc = "Open a new tab with terminal" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close a tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Move to next tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Move to previous tab" })

-- Terminal
keymap.set("n", "<leader>tt", function()
    vim.cmd("split | terminal")
    vim.cmd("startinsert")
end, { desc = "Open split terminal" })

keymap.set("n", "<leader>ty", function()
    vim.cmd("vsplit | terminal")
    vim.cmd("startinsert")
end, { desc = "Open vsplit terminal" })

-- Terminal escape fix
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move left from terminal" })
keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move down from terminal" })
keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move up from terminal" })
keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move right from terminal" })

-- Useful binds
--
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })
-- Move selected lines up/down in Visual Mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Keep cursor centered during half-page jumps
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep search terms centered
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
-- Stay in visual mode while indenting
keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection" })
-- Create undo breakpoints for common punctuation
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")
keymap.set("i", "(", "(<c-g>u")



-- Rust debugging (DAP/llbl)
-- keymap.set("n", "<leader>bww", function()
--     local ui_open = false
--     for _, win in pairs(vim.api.nvim_list_wins()) do
--         local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
--         if bufname:match("DAP") then
--             ui_open = true
--             break
--         end
--     end
--     if ui_open then
--         require("dapui").close()
--     else
--         require("dapui").open()
--     end
-- end, { desc = "Toggle dap-ui" })
--
-- _G.dap_scopes_sidebar = nil -- global scope sidebar instance
-- keymap.set("n", "<leader>bws", function()
--     local widgets = require("dap.ui.widgets")
--     if not _G.dap_scopes_sidebar then
--         _G.dap_scopes_sidebar = widgets.sidebar(widgets.scopes)
--     end
--     local sidebar = _G.dap_scopes_sidebar
--     -- Detect if buffer is visible in any window
--     local buf = sidebar.buf
--     local is_open = false
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--         if vim.api.nvim_win_get_buf(win) == buf then
--             is_open = true
--             break
--         end
--     end
--
--     if is_open then
--         sidebar:close()
--     else
--         sidebar:open()
--     end
-- end, { desc = "Toggle dap-ui scopes" })

-- keymap.set("n", "<leader>bb", "<cmd>:DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
-- keymap.set("n", "<leader>bbc", "<cmd>:DapClearBreakpoints<CR>", { desc = "Clear breakpoints" })
-- keymap.set("n", "<leader>br", function()
--     vim.cmd.RustLsp('debuggables')
--     require("dapui").open()
-- end, { desc = "Start Rust Debugging" })
-- keymap.set("n", "<leader>bq", function()
--     require("dap").terminate()
--     require("dapui").close()
-- end, { desc = "Terminate" })
-- keymap.set("n", "<leader>bc", "<cmd>:DapContinue<CR>", { desc = "Continue" })
-- keymap.set("n", "<leader>ba", "<cmd>:DapStepInto<CR>", { desc = "Step into" })
-- keymap.set("n", "<leader>bs", "<cmd>:DapStepOut<CR>", { desc = "Step out" })
-- keymap.set("n", "<leader>bd", "<cmd>:DapStepOver<CR>", { desc = "Step over" })
