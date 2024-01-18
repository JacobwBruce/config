return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catpuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
			})
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("nightfly")
		end,
	},
	{
		"embark-theme/vim",
		name = "embark",
		config = function()
			-- vim.cmd.colorscheme("embark")
		end,
	},
}
