return {
	"Mirsmog/real-icons.nvim",
	lazy = false,
	priority = 1100,
	opts = {
		pack = "flow",
		packs = {
			flow = {
				type = "vscode",
				path = vim.fn.expand("~/.vscode/extensions/thang-nm.flow-icons-2.0.3"),
				theme = "flow-deep",
				license = "personal",
			},
		},
		integrations = {
			telescope = true,
			neo_tree = true,
			-- lualine = true,
			snacks_picker = true,
		},
	},
}
