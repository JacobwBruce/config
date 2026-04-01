return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local sources = {}

		local function add_if(exe, source)
			if vim.fn.executable(exe) == 1 then
				table.insert(sources, source)
			end
		end

		local function format_with_null_ls(bufnr)
			vim.lsp.buf.format({
				bufnr = bufnr,
				async = false,
				filter = function(format_client)
					return format_client.name == "null-ls"
				end,
			})
		end

		add_if("stylua", null_ls.builtins.formatting.stylua)
		if vim.fn.executable("prettierd") == 1 then
			table.insert(sources, null_ls.builtins.formatting.prettierd)
		elseif vim.fn.executable("prettier") == 1 then
			table.insert(sources, null_ls.builtins.formatting.prettier)
		end
		add_if("gofumpt", null_ls.builtins.formatting.gofumpt)
		add_if("goimports-reviser", null_ls.builtins.formatting.goimports_reviser)
		add_if("golines", null_ls.builtins.formatting.golines)
		add_if("rubocop", null_ls.builtins.diagnostics.rubocop)
		add_if("rubocop", null_ls.builtins.formatting.rubocop)
		add_if("mypy", null_ls.builtins.diagnostics.mypy)
		add_if("pylint", null_ls.builtins.diagnostics.pylint)
		add_if("black", null_ls.builtins.formatting.black)

		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							format_with_null_ls(bufnr)
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", function()
			format_with_null_ls(vim.api.nvim_get_current_buf())
		end, {
			desc = "Format current buffer",
		})
	end,
}
