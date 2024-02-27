return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            })
            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                ["javascript"] = { "prettier" },
                ["javascriptreact"] = { "prettier" },
                ["typescript"] = { "prettier" },
                ["typescriptreact"] = { "prettier" },
                ["vue"] = { "prettier" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        }
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
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = '[G]it [S]tatus' })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    { 'windwp/nvim-ts-autotag' },
    { 'tpope/vim-sleuth' },
    { 'laytan/cloak.nvim',     opts = {} }
}
