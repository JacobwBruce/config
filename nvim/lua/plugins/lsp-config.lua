return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require("lspconfig/util")

      local lspconfig = require("lspconfig")

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command(params)
      end

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
        commands = {
          OrganizeImports = {
            organize_imports,
            desc = "Organize Imports",
          },
        },
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = util.root_pattern("tailwind.config.js", "package.json", "postcss.config.js", ".git"),
      })

      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "scss", "sass", "javascriptreact", "less", "typescriptreact", "svelte" },
      })

      lspconfig.prismals.setup({
        capabilities = capabilities,
        filetypes = { "prisma" },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {
        desc = "Show hover",
      })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {
        desc = "Go to definition",
      })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
        desc = "Code action",
      })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
        desc = "Rename variable",
      })
    end,
  },
}
