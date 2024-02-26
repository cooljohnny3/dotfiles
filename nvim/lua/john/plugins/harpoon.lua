return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({})

        vim.keymap.set("n", "<leader>hu", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "[H]arpoon [U]i" })
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "[H]arpoon [A]ppend" })

        vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "[H]arpoon nav to [1]" })
        vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "[H]arpoon nav to [2]" })
        vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "[H]arpoon nav to [3]" })
        vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "[H]arpoon nav to [4]" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "[H]arpoon nav to [P]rev" })
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "[H]arpoon nav to [N]ext" })
    end
}
