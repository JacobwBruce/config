return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = { light = "latte", dark = "mocha" }, -- latte, frappe, macchiato, mocha
        transparent_background = true,
        styles = {
          comments = { "italic" },
          functions = { "italic", "bold" },
          keywords = { "italic" },
          operators = { "bold" },
          conditionals = { "italic" },
          loops = { "italic" },
          booleans = { "bold", "italic" },
          numbers = {},
          types = {},
          strings = { "bold" },
          variables = {},
          properties = {},
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
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          notify = true,
          nvimtree = true,
          rainbow_delimiters = true,
          render_markdown = true,
          semantic_tokens = true,
          telescope = { enabled = true, style = "nvchad" },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
          harpoon = true,
          noice = true,
        },
        color_overrides = {
          all = {
            green = "#a4dfae",
            peach = "#eecfa0",
            red = "#edabab",
            -- white = "#f3f2f2",
            -- purple = "#d2ccff",
            -- mauve = "#d2ccff",
            -- lavender = "#f3f2f2",
            cyan = "#a1e8e5",
            blue = "#8fc7ff",
          },
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
      local palette = require("tokyo_overrides").default

      require("tokyonight").setup({
        style = palette._style,
        transparent = palette.transparent,
        styles = {
          -- comments = { italic = false },
          -- keywords = { italic = false },
          strings = { bold = true },
          sidebars = palette.transparent and "transparent" or "dark",
          floats = palette.transparent and "transparent" or "dark",
        },
        on_colors = function(c)
          for k, v in pairs(palette) do
            if type(v) ~= "table" and not k:match("^_") then
              c[k] = v
            end
          end
        end,
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
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {         -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none",
                border = "rounded",
              },
            },
          },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            Pmenu = { fg = theme.ui.shade0, bg = "NONE", blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptBorder = { fg = theme.ui.special },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim },
            TelescopeResultsBorder = { fg = theme.ui.special },
            TelescopePreviewBorder = { fg = theme.ui.special },
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
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
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require("night-owl").setup({
          transparent_background = true,
        })
      end,
    },
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        variant = "default",
        styles = {
          booleans = { bold = true },
          functions = { italic = true },
          comments = { italic = true },
        },
        highlight_overrides = {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          CursorLine = { bg = "#222128" },
        },
      })
    end,
  },
  {
    "tiesen243/vercel.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vercel").setup({
        theme = "dark",  -- String: Sets the theme to light or dark (Default: light)
        transparent = true, -- Boolean: Sets the background to transparent (Default: false)
        italics = {
          comments = true, -- Boolean: Italicizes comments (Default: true)
          keywords = true, -- Boolean: Italicizes keywords (Default: true)
          functions = true, -- Boolean: Italicizes functions (Default: true)
          strings = true, -- Boolean: Italicizes strings (Default: true)
          variables = true, -- Boolean: Italicizes variables (Default: true)
          bufferline = false, -- Boolean: Italicizes bufferline (Default: false)
        },
      })
    end,
  },
}
