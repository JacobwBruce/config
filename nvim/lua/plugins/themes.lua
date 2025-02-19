return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        -- term_colors = true,
        transparent_background = true,
        integrations = {
          harpoon = true,
          neotree = true,
          noice = true,
          notify = true,
          which_key = true,
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.g.nightflyTransparent = true
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        -- on_colors = function(colors)
        -- colors.green = "#7AE582"
        -- colors.green = "#85e6a9"
        -- end,
      })
    end,
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italics = "1"
      vim.g.sonokai_style = "andromeda"
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "sam4llis/nvim-tundra",
    name = "tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-tundra").setup({
        transparent_background = true,
      })
      vim.g.tundra_biome = "arctic" -- 'arctic' or 'jungle'
      vim.opt.background = "dark"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
    end,
  },
  {
    "Yagua/nebulous.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nebulous").setup({
        disable = {
          background = true,
        },
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = { transparent_background = true },
    config = function(_, opts)
      require("tokyodark").setup(opts)
    end,
  },
}
