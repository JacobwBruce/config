return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local config = {
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
				theme = "auto",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		local function insert_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function insert_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		insert_left({ "branch", icon = "" })
		insert_left({ "diff", symbols = { added = " ", modified = " ", removed = " " } })
		insert_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
		})
		insert_left({
			function()
				return "%="
			end,
		})
		insert_right({ "location" })
		insert_right({ "filetype" })

		require("lualine").setup(config)
	end,
}
