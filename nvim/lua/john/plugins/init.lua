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
    -- {
    --     'windwp/nvim-autopairs',
    --     event = "InsertEnter",
    --     config = true
    -- },
    { 'tpope/vim-sleuth' },
    { 'laytan/cloak.nvim', opts = {} },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    }
}
