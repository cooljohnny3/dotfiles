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
            map('n', ']h', function()
                gs.next_hunk({ navigation_message = false })
                vim.api.nvim_feedkeys('zz', 'n', false)
            end, { desc = 'Next Hunk' })
            map('n', '[h', function()
                gs.prev_hunk({ navigation_message = false })
                vim.api.nvim_feedkeys('zz', 'n', false)
            end, { desc = 'Prev Hunk' })
            map('n', '<leader>gs', function() gs.stage_hunk() end, { desc = '[G]it [S]tage Hunk' })
            map('n', '<leader>gr', function() gs.reset_hunk() end, { desc = '[G]it [R]eset Hunk' })
            map('n', '<leader>gu', function() gs.undo_stage_hunk() end, { desc = '[G]it [U]ndo Stage Hunk' })
            map('n', '<leader>gb', function() gs.blame_line({ full = false }) end, { desc = '[G]it [B]lame line' })
            map('n', '<leader>gd', function() gs.diffthis() end, { desc = '[G]it [d]iff against index' })
            map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = '[G]it [D]iff against last commit' })
            -- Toggles
            map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[G]it [T]oggle [B]lame line' })
        end,
    },
}
