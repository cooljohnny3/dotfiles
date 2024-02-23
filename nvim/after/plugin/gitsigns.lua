require('gitsigns').setup(
  {
    -- See `:help gitsigns.txt`
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
      map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [D]iff against index' })

      -- Toggles
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[G]it [T]oggle [B]lame line' })
      map('n', '<leader>gtd', gs.toggle_deleted, { desc = '[G]it [T]oggle show [D]eleted' })
    end,
  })
