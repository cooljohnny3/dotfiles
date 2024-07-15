return {
    'folke/which-key.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
        spec = {
            { "<leader>c",  group = "[C]ode" },
            { "<leader>d",  group = "[D]ocument" },
            { "<leader>g",  group = "[G]it" },
            { "<leader>gt", group = "[T]oggle" },
            { "<leader>h",  group = "[H]arpoon" },
            { "<leader>r",  group = "[R]ename" },
            { "<leader>s",  group = "[S]earch" },
            { "<leader>t",  group = "[T]rouble" },
            { "<leader>u",  group = "[U]ndo tree" },
            { "<leader>w",  group = "[W]orkspace" },
        }
    },
}
