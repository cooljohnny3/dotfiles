return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- `storm`, `moon`, a darker variant `night` and `day`
            vim.cmd.colorscheme('tokyonight-night')
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                ["javascript"] = { "prettier" },
                ["javascriptreact"] = { "prettier" },
                ["typescript"] = { "prettier" },
                ["typescriptreact"] = { "prettier" },
                ["vue"] = { "prettier" },
            }
        }
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },
    {
        'echasnovski/mini.comment',
        version = '*',
        opts = {
            mappings = {
                comment = '',
                comment_line = '<C-_>',
                comment_visual = '<C-_>',
                textobject = '',
            },
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gS", vim.cmd.Git, { desc = '[G]it [S]tatus' })
        end
    },
    { 'tpope/vim-sleuth' },
    { 'laytan/cloak.nvim', opts = {} },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            action_keys = {                                  -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping
                close = "q",                                 -- close the list
                cancel = "<esc>",                            -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r",                               -- manually refresh
                jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" },                    -- open buffer in new split
                open_vsplit = { "<c-v>" },                   -- open buffer in new vsplit
                open_tab = { "<c-t>" },                      -- open buffer in new tab
                jump_close = { "o" },                        -- jump to the diagnostic and close the list
                toggle_mode = "m",                           -- toggle between "workspace" and "document" diagnostics mode
                switch_severity = "s",                       -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
                toggle_preview = "P",                        -- toggle auto_preview
                hover = "K",                                 -- opens a small popup with the full multiline message
                preview = "p",                               -- preview the diagnostic location
                open_code_href = "c",                        -- if present, open a URI with more information about the diagnostic error
                close_folds = { "zM", "zm" },                -- close all folds
                open_folds = { "zR", "zr" },                 -- open all folds
                toggle_fold = { "zA", "za" },                -- toggle fold of current file
                previous = "k",                              -- previous item
                next = "j",                                  -- next item
                help = "?"                                   -- help menu
            },
        },
        config = function()
            vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end, { desc = 'Open [T]rouble' })
            vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end,
                { desc = '[T]rouble [W]orkspace' })
            vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end,
                { desc = '[T]rouble [D]ocument' })
            vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end,
                { desc = '[T]rouble [Q]uickfix' })
            -- vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
            -- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
        end
    },
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        cond = function()
            local path = vim.api.nvim_buf_get_name(0)
            return not string.find(path, "code/nts")
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
