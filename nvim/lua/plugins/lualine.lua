return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "auto",
    options = {
      component_separators = " ",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = { "branch", "diff", "diagnostics" },
      lualine_y = {},
      lualine_z = { "location" },
    },
  },
}
