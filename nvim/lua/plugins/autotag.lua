return {
  "windwp/nvim-ts-autotag",
  ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
