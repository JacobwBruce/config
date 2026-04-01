-- calling setup() doesn't work for some reason
-- each mini submodule must include a config to work

return {
	"echasnovski/mini.nvim",
	version = "*",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		local icons = require("mini.icons")
		icons.setup({
			style = "glyph",
			extension = {
				css = { glyph = "", hl = "MiniIconsBlue" },
				go = { glyph = "󰟓", hl = "MiniIconsCyan" },
				html = { glyph = "", hl = "MiniIconsOrange" },
				java = { glyph = "", hl = "MiniIconsRed" },
				js = { glyph = "󰌞", hl = "MiniIconsYellow" },
				json = { glyph = "󰘦", hl = "MiniIconsYellow" },
				jsx = { glyph = "󰜈", hl = "MiniIconsCyan" },
				lua = { glyph = "λ", hl = "MiniIconsBlue" },
				md = { glyph = "", hl = "MiniIconsGrey" },
				prisma = { glyph = "", hl = "MiniIconsCyan" },
				py = { glyph = "", hl = "MiniIconsYellow" },
				rs = { glyph = "", hl = "MiniIconsOrange" },
				toml = { glyph = "", hl = "MiniIconsGrey" },
				ts = { glyph = "󰛦", hl = "MiniIconsBlue" },
				tsx = { glyph = "󰜈", hl = "MiniIconsBlue" },
				yaml = { glyph = "", hl = "MiniIconsPurple" },
				yml = { glyph = "", hl = "MiniIconsPurple" },
			},
			file = {
				[".dockerignore"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
				[".env"] = { glyph = "󰒓", hl = "MiniIconsGreen" },
				["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
				["Makefile"] = { glyph = "", hl = "MiniIconsGrey" },
				["package-lock.json"] = { glyph = "", hl = "MiniIconsRed" },
				["package.json"] = { glyph = "", hl = "MiniIconsRed" },
				["tsconfig.json"] = { glyph = "󰛦", hl = "MiniIconsBlue" },
			},
			filetype = {
				javascriptreact = { glyph = "󰜈", hl = "MiniIconsCyan" },
				typescriptreact = { glyph = "󰜈", hl = "MiniIconsCyan" },
			},
		})
		icons.mock_nvim_web_devicons()

		require("mini.ai").setup()

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
		local comment = require("mini.comment")
		comment.setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})
	end,
}
