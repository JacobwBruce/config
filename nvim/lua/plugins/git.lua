return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        },
      })

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {
        desc = "Preview hunk",
      })

      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {
        desc = "Toggle current line blame",
      })
    end,
  },
}
