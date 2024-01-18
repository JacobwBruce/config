return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({})
    local harpoon = require("harpoon.ui")
    local mark = require("harpoon.mark")

    vim.keymap.set("n", "<Leader>hh", harpoon.toggle_quick_menu, {
      desc = "Toggle Harpoon Quick Menu",
    })
    vim.keymap.set("n", "<Leader>ha", mark.add_file, {
      desc = "Add current file to Harpoon",
    })
    vim.keymap.set("n", "<Leader>hn", harpoon.nav_next, {
      desc = "Navigate to next Harpoon mark",
    })
    vim.keymap.set("n", "<Leader>hp", harpoon.nav_prev, {
      desc = "Navigate to previous Harpoon mark",
    })
  end,
}
