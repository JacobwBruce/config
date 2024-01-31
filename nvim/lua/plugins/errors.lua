return {
  {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      -- your options go here
    },
  },
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --     -- vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
  --     -- set updatetime=1000
  --     vim.cmd([[autocmd! CursorHold * lua vim.diagnostic.show_line_diagnostics({ focusable = false })]])
  --     vim.cmd(
  --       [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]
  --     )
  --   end,
  -- },
}
