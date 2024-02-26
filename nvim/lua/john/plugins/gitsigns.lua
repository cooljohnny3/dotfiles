return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Actions
            -- normal mode
            map('n', '<leader>gb', function()
                gs.blame_line { full = false }
            end, { desc = '[G]it [B]lame line' })
            map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [d]iff against index' })
            map('n', '<leader>gD', function()
                gs.diffthis '~'
            end, { desc = '[G]it [D]iff against last commit' })

            -- Toggles
            map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[G]it [T]oggle [B]lame line' })
            map('n', '<leader>gtd', gs.toggle_deleted, { desc = '[G]it [T]oggle show [D]eleted' })
        end,
    },
}
