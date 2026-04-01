return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				sorting_strategy = "descending",
				layout_config = {
					prompt_position = "bottom",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					sort_mru = true,
					ignore_current_buffer = true,
				},
			},
			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown({}),
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		pcall(telescope.load_extension, "ui-select")
		pcall(telescope.load_extension, "fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Go to references" })
	end,
}
