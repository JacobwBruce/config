return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	dependencies = {
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			-- require("luasnip.loaders.from_vscode").lazy_load()

			local borders = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
			cmp.setup({
				-- snippet = {
				--   expand = function(args)
				--     require("luasnip").lsp_expand(args.body)
				--   end,
				-- },
				window = {
					completion = cmp.config.window.bordered({
						border = borders,
						winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
						zindex = 1001,
						scrollbar = true,
						col_offset = -3, -- shift the text a bit left/right
						side_padding = 1, -- extra padding around entries
					}),
					documentation = cmp.config.window.bordered({
						border = borders,
						winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
						zindex = 1001,
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "luasnip" }, -- For luasnip users.
					{ name = "crates" },
					{ name = "emoji" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					fields = { "kind", "abbr" },
					format = function(_, item)
						local symbol = lspkind.symbolic(item.kind, { mode = "symbol" })
						item.kind = string.format("%s %s", symbol or "", item.kind)
						return item
					end,
				},
			})
			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			-- dadbod UI
			cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})
		end,
	},
}
