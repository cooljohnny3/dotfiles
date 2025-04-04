return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
			{ "<leader>st", ":TodoTelescope<cr>", desc = "[S]earch [T]odos" },
		},
	},
	{
		"echasnovski/mini.comment",
		version = "*",
		opts = {
			mappings = {
				comment = "",
				comment_line = "<C-_>",
				comment_visual = "<C-_>",
				textobject = "",
			},
		},
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
	{ 'laytan/cloak.nvim', opts = {} },
	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
		end
	},
}
