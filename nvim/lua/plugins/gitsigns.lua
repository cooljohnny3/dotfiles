-- See `:help gitsigns` to understand what the configuration keys do
return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]h", bang = true })
				else
					gitsigns.nav_hunk('next')
					vim.api.nvim_feedkeys("zz", "n", false)
				end
			end, { desc = "Next Hunk" })
			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
				else
					gitsigns.nav_hunk('prev')
					vim.api.nvim_feedkeys("zz", "n", false)
				end
			end, { desc = "Prev Hunk" })

			-- Actions
			map("n", "<leader>gs", gitsigns.stage_hunk,
				{ desc = "[G]it [S]tage Hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk,
				{ desc = "[G]it [R]eset Hunk" })
			map("n", "<leader>gu", gitsigns.stage_hunk,
				{ desc = "[G]it [U]ndo Stage Hunk" })
			map("n", "<leader>gb", function() gitsigns.blame_line { full = false } end,
				{ desc = "[G]it [B]lame line" })
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "[G]it [d]iff against index" })
			map("n", "<leader>gD", function() gitsigns.diffthis("@") end,
				{ desc = "[G]it [D]iff against last commit" })

			-- Toggles
			map("n", "<leader>gtb", gitsigns.toggle_current_line_blame,
				{ desc = "[G]it [T]oggle [B]lame line" })
		end,
	},
}
