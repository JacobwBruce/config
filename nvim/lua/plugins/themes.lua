return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catpuccin",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
      })
      -- vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("nightfly")
    end,
  },
  {
    "embark-theme/vim",
    name = "embark",
    config = function()
      -- vim.cmd.colorscheme("embark")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          -- colors.green = "#7AE582"
          colors.green = "#85e6a9"
        end,
      })
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
