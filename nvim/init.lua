-- require("vim._core.ui2").enable({})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.o.termguicolors = true
vim.o.linespace = 10

require("key-maps")
require("vim-options")
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		-- { import = "plugins.lsp" },
	},
})

vim.cmd.colorscheme("dim-night")

local function clear_inlay_hint_bg()
	local fg = vim.api.nvim_get_hl(0, { name = "Comment", link = true }).fg
	if not fg then
		fg = vim.api.nvim_get_hl(0, { name = "DiagnosticHint", link = true }).fg
	end

	if fg then
		pcall(vim.api.nvim_set_hl, 0, "LspInlayHint", { fg = fg, bg = "NONE" })
		pcall(vim.api.nvim_set_hl, 0, "LspInlayHintParameter", { fg = fg, bg = "NONE" })
		pcall(vim.api.nvim_set_hl, 0, "LspInlayHintType", { fg = fg, bg = "NONE" })
	else
		pcall(vim.api.nvim_set_hl, 0, "LspInlayHint", { bg = "NONE" })
		pcall(vim.api.nvim_set_hl, 0, "LspInlayHintParameter", { bg = "NONE" })
		pcall(vim.api.nvim_set_hl, 0, "LspInlayHintType", { bg = "NONE" })
	end
end

local supportedThemes = { "nightfly", "rose-pine" }

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- if vim.g.colors_name == "nightfly" then
		-- 	vim.schedule(clear_inlay_hint_bg)
		-- end
		if vim.tbl_contains(supportedThemes, vim.g.colors_name) then
			vim.schedule(clear_inlay_hint_bg)
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		if vim.tbl_contains(supportedThemes, vim.g.colors_name) then
			vim.schedule(clear_inlay_hint_bg)
		end
	end,
})

if vim.tbl_contains(supportedThemes, vim.g.colors_name) then
	clear_inlay_hint_bg()
end

local function make_lualine_transparent()
	local names = vim.fn.getcompletion("lualine", "highlight")

	for _, name in ipairs(names) do
		-- Keep the mode section's colors
		if not name:match("^lualine_a_") then
			local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name })
			if ok then
				hl.bg = "NONE"
				pcall(vim.api.nvim_set_hl, 0, name, hl)
			end
		end
	end

	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
end

vim.schedule(make_lualine_transparent)
