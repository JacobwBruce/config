return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = { light = "latte", dark = "macchiato" }, -- latte, frappe, macchiato, mocha
        transparent_background = true,
        styles = {
          comments = { "italic" },
          functions = { "italic", "bold" },
          keywords = { "italic" },
          operators = { "bold" },
          conditionals = { "italic" },
          loops = { "italic" },
          booleans = { "bold", "italic" },
          -- numbers = {},
          -- types = {},
          strings = { "bold" },
          -- variables = {},
          -- properties = {},
        },
        integrations = {
          cmp = true,
          dap = true,
          dap_ui = true,
          diffview = true,
          dropbar = { enabled = true, color_mode = true },
          fidget = true,
          flash = true,
          fzf = true,
          gitsigns = true,
          grug_far = true,
          hop = true,
          indent_blankline = { enabled = true, colored_indent_levels = true },
          lsp_saga = true,
          lsp_trouble = true,
          markdown = true,
          mason = true,
          mini = { enabled = true, indentscope_color = "" },
          notify = true,
          nvimtree = true,
          rainbow_delimiters = true,
          render_markdown = true,
          semantic_tokens = true,
          telescope = { enabled = true },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
          harpoon = true,
          noice = true,
        },
        custom_highlights = function(colors)
          return {
            ["@keyword"] = { fg = colors.red, style = { "bold", "italic" } },
            ["@keyword.import"] = { fg = colors.red, style = { "bold" } },

            -- Function-specific keywords (like "function")
            ["@keyword.function"] = { fg = colors.red, style = { "bold", "italic" } },

            -- Variable declaration keywords (let, const, var)
            ["@keyword.var"] = { fg = colors.red, style = { "bold", "italic" } },
          }
        end,
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
      vim.g.nightflyNormalFloat = true
      vim.g.nightflyCursorColor = true

      local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "nightfly",
        callback = function()
          vim.api.nvim_set_hl(0, "Boolean", { fg = "#FF5874", bold = true })
          vim.api.nvim_set_hl(0, "String", { fg = "#ECC58D", bold = true })
          vim.api.nvim_set_hl(0, "Function", { fg = "#82aaff", italic = true })
          vim.api.nvim_set_hl(0, "Comment", { fg = "#7D8F8F", italic = true })
        end,
        group = custom_highlight,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "folkeTokyonight",
    config = function()
      local transparent = true
      local bg = "#011628"
      local bg_dark = "#011424"
      -- local bg_highlight = "#143652"
      -- local bg_search = "#0A64AC"
      -- local bg_visual = "#275378"
      -- local fg = "#CBE0F0"
      -- local fg_dark = "#B4D0E9"
      -- local fg_gutter = "#627E97"
      -- local border = "#547998"
      --
      require("tokyonight").setup({
        style = "night",
        transparent = transparent,

        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = transparent and colors.none or bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          --     colors.bg_highlight = bg_highlight
          --     colors.bg_popup = bg_dark
          --     colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          --     colors.bg_visual = bg_visual
          --     colors.border = border
          --     colors.fg = fg
          --     colors.fg_dark = fg_dark
          --     colors.fg_float = fg
          --     colors.fg_gutter = fg_gutter
          --     colors.fg_sidebar = fg_dark
        end,
      })
      -- vim.cmd("colorscheme tokyonight")
      -- NOTE: Auto switch to tokyonight for markdown files only
      -- vim.api.nvim_create_autocmd("FileType", {
      --     pattern = { "markdown" },
      --     callback = function()
      --         -- Ensure the theme switch only happens once for a buffer
      --         local buffer = vim.api.nvim_get_current_buf()
      --         if not vim.b[buffer].tokyonight_applied then
      --             if vim.fn.expand("%:t") ~= "" and vim.api.nvim_buf_get_option(0, "buftype") ~= "nofile" then
      --                 vim.cmd("colorscheme tokyonight")
      --             end
      --             vim.b[buffer].tokyonight_applied = true
      --         end
      --     end,
      -- })
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
    "webhooked/norrsken.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("norrsken").setup({
        -- colorscheme = "norrsken-reykjavik",
        transparent_bg = true,
      })
    end,
  },
  {
    {
      "oxfist/night-owl.nvim",
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require("night-owl").setup({
          transparent_background = true,
        })
      end,
    },
  },
  {
    "tiesen243/vercel.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vercel").setup({
        theme = "dark",       -- String: Sets the theme to light or dark (Default: light)
        transparent = true,   -- Boolean: Sets the background to transparent (Default: false)
        italics = {
          comments = true,    -- Boolean: Italicizes comments (Default: true)
          keywords = true,    -- Boolean: Italicizes keywords (Default: true)
          functions = true,   -- Boolean: Italicizes functions (Default: true)
          strings = true,     -- Boolean: Italicizes strings (Default: true)
          variables = true,   -- Boolean: Italicizes variables (Default: true)
          bufferline = false, -- Boolean: Italicizes bufferline (Default: false)
        },
      })
    end,
  },
}
