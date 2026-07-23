return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.nvim" },
	config = function()
		local config = {
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						left_padding = 0,
						right_padding = 0,
						separator = { left = "", right = "" },
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}

		local function insert_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function insert_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		insert_left({ "branch", icon = "" })

		insert_left({
			"diff",
			color = { bg = "NONE" },
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
		})

		insert_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = {
				error = " ",
				warn = " ",
				info = " ",
			},
		})

		insert_left(function()
			return "%="
		end)

		-- insert_right({ "location" })

		insert_right({
			require("real-icons.integrations.lualine").component,
			padding = { left = 1, right = 0 },
		})

		-- insert_right({
		-- 	"filetype",
		-- 	icons_enabled = false,
		-- 	padding = { left = 0, right = 1 },
		-- })

		require("lualine").setup(config)
	end,
}
