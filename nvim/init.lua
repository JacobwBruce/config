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

vim.cmd.colorscheme("material")

-- place this after `require("lualine").setup(config)` in your lualine config
local function make_lualine_transparent()
	local none = { bg = "NONE" }

	local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
	local sections = { "b", "c", "x", "y", "z" }

	-- make all non-mode sections transparent
	for _, mode in ipairs(modes) do
		for _, sec in ipairs(sections) do
			local group = ("lualine_%s_%s"):format(sec, mode)
			pcall(vim.api.nvim_set_hl, 0, group, none)
		end
	end

	-- make inactive mode section transparent too
	pcall(vim.api.nvim_set_hl, 0, "lualine_a_inactive", none)

	-- clear common statusline groups
	pcall(vim.api.nvim_set_hl, 0, "StatusLine", none)
	pcall(vim.api.nvim_set_hl, 0, "StatusLineNC", none)
end

-- call it once immediately (use vim.schedule to ensure it runs after setup/render)
vim.schedule(function()
	make_lualine_transparent()
end)

-- re-apply after any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		make_lualine_transparent()
	end,
})
