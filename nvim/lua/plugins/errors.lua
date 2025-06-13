return {
	{
		-- "chikko80/error-lens.nvim",
		-- event = "BufRead",
		-- dependencies = {
		-- 	"nvim-telescope/telescope.nvim",
		-- },
		-- opts = {
		-- 	-- your options go here
		-- },
	},
	-- {
	--   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	--   config = function()
	--     require("lsp_lines").setup()
	--     -- vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
	--     -- set updatetime=1000
	--     vim.cmd([[autocmd! CursorHold * lua vim.diagnostic.show_line_diagnostics({ focusable = false })]])
	--     vim.cmd(
	--       [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]
	--     )
	--   end,
	-- },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
