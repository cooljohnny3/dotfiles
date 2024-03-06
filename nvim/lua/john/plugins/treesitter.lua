return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'windwp/nvim-ts-autotag',
            'nvim-treesitter/nvim-treesitter-context',
        },
        build = ':TSUpdate',
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = {
                    'bash',
                    'c',
                    'cpp',
                    'diff',
                    'html',
                    'go',
                    'javascript',
                    'json',
                    'lua',
                    'luadoc',
                    'markdown',
                    'python',
                    'rust',
                    'tsx',
                    'typescript',
                    'vim',
                    'vimdoc',
                },
                -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
                auto_install = true,
                -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
                modules = {},
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<M-space>',
                    },
                },
            })
            require("treesitter-context").setup({
                max_lines = 3
            })
        end
    },
}
