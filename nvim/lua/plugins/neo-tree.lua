return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignore = false,
      },
    },
    window = {
      auto_expand_width = true,
    },
    hide_root_node = true,
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set(
      "n",
      "<C-n>",
      ":Neotree toggle filesystem reveal left<CR>",
      { silent = true, desc = "Toggle NeoTree" }
    )
  end,
}
