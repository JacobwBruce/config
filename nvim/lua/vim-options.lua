vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local opt = vim.opt

-- opt.colorcolumn = "120"
opt.guicursor = {
  "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
}
-- vim.wo.number = true
-- vim.wo.relativenumber = true
opt.relativenumber = true
opt.number = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true
opt.cursorlineopt = "number"

opt.termguicolors = true
