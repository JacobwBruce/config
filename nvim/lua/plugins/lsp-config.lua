return {
	-- Mason (installs tooling)
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	-- Mason bridge for LSP servers (installs + auto-enables)
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"ts_ls",
				"tailwindcss",
				"emmet_ls",
				"prismals",
				"html",
				"lua_ls",
				"cssls",
				"gopls",
				"jdtls",
				"pyright",
			},
			-- Neovim 0.11+: let mason-lspconfig autoload servers via vim.lsp.enable()
			automatic_enable = true,
		},
		dependencies = {
			{ "williamboman/mason.nvim" },
			"neovim/nvim-lspconfig", -- still provides the per-server defaults Neovim can merge with
		},
	},

	-- Core LSP configuration (no require('lspconfig').*.setup here!)
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Shared capabilities for all servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Apply to every server via the "*" config
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Helper: TS organize imports (works as an LSP command callback)
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			-- Create a user command for OrganizeImports
			vim.api.nvim_create_user_command(
				"OrganizeImports",
				organize_imports,
				{ desc = "Organize TypeScript imports" }
			)

			-- Per-server overrides (these MERGE with defaults from nvim-lspconfig)
			-- TypeScript
			vim.lsp.config("ts_ls", {
				init_options = {
					preferences = {
						disableSuggestions = true,
						importModuleSpecifierPreference = "relative",
						includeCompletionsForModuleExports = true,
						includeCompletionsForImportStatements = true,
					},
				},
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							-- includeInlayFunctionParameterTypeHints = true,
							-- includeInlayVariableTypeHints = true,
							-- includeInlayPropertyDeclarationTypeHints = true,
							-- includeInlayFunctionLikeReturnTypeHints = true,
							-- includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})

			-- Tailwind CSS
			vim.lsp.config("tailwindcss", {
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
				-- Neovim will also consider root markers when enabling; this is a light override.
				root_markers = { "tailwind.config.js", "package.json", "postcss.config.js", ".git" },
			})

			-- Emmet
			vim.lsp.config("emmet_ls", {
				filetypes = { "html", "css", "scss", "sass", "javascriptreact", "less", "typescriptreact", "svelte" },
			})

			-- Prisma
			vim.lsp.config("prismals", {
				filetypes = { "prisma" },
			})

			-- HTML / Lua / CSS
			vim.lsp.config("html", {})
			vim.lsp.config("lua_ls", {})
			vim.lsp.config("cssls", {})

			-- Go
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = { unusedparams = true },
						hints = {
							functionTypeParameters = true,
							parameterNames = true,
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					local gopls = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })[1]
					local enc = (gopls and gopls.offset_encoding) or "utf-16"
					local params = vim.lsp.util.make_range_params(0, enc)
					params.context = { only = { "source.organizeImports" } }
					-- buf_request_sync defaults to a 1000ms timeout. Depending on your
					-- machine and codebase, you may want longer. Add an additional
					-- argument after params if you find that you have to write the file
					-- twice for changes to be saved.
					-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
					local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								local client_enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or enc
								vim.lsp.util.apply_workspace_edit(r.edit, client_enc)
							end
						end
					end
					vim.lsp.buf.format({ async = false })
				end,
			})

			-- Java
			vim.lsp.config("jdtls", {})

			-- Python
			vim.lsp.config("pyright", {
				filetypes = { "python" },
				settings = {
					python = {
						venvPath = ".",
						venv = ".venv",
						analysis = {
							diagnosticMode = "workspace",
						},
					},
				},
			})
			-- Keymaps (buffer-local on LspAttach; lets Neovim’s sane defaults stand)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my.lsp.keys", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
					vim.keymap.set(
						"n",
						"<leader>gd",
						vim.lsp.buf.definition,
						vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" })
					)
					vim.keymap.set(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "LSP: Code action" })
					)
					vim.keymap.set(
						"n",
						"<leader>rn",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "LSP: Rename symbol" })
					)
					-- Enable inlay hints
					if vim.lsp.inlay_hint then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end
				end,
			})

			-- OPTIONAL: If you prefer to explicitly enable (instead of mason-lspconfig’s automatic_enable),
			-- uncomment below. Neovim 0.11+ will auto-start these based on filetypes/root.
			-- vim.lsp.enable({ "ts_ls","tailwindcss","emmet_ls","prismals","html","lua_ls","cssls","gopls","jdtls","pyright" })
		end,
	},
}
