return {
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^4',
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
        config = function()
            local ht = require('haskell-tools')
            local bufnr = vim.api.nvim_get_current_buf()
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- 1. Explicit Cabal REPL
            vim.keymap.set('n', '<leader>hc', function()
                vim.cmd("split | term cabal repl")
            end, { desc = "Open Cabal REPL" })

            -- 2. Explicit Stack REPL
            vim.keymap.set('n', '<leader>hs', function()
                vim.cmd("split | term stack repl")
            end, { desc = "Open Stack REPL" })

            -- Haskell LSP Binds
            -- keymap.set("n", "<leader>hl", vim.lsp.codelens.run, { desc = "LSP: Run CodeLens" })
            -- keymap.set("n", "<leader>ha", vim.lsp.buf.code_action, { desc = "LSP: Code Actions" })
            -- keymap.set("n", "<leader>hr", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
        end
    }
}
