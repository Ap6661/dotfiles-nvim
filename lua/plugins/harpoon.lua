return {
  "ThePrimeagen/harpoon",
  dependencies = {
    {"nvim-lua/plenary.nvim"},
  },
  config = function ()
    local opts = {
      noremap = true,
      silent = true,
    }
    vim.keymap.set('n', '<Leader>[',      ':lua require("harpoon.ui").toggle_quick_menu()<Cr>', opts)
    vim.keymap.set('n', '<Leader><Tab>',  ':lua require("harpoon.mark").add_file()<Cr>', opts)
    vim.keymap.set('n', '<C-v>',          ':lua require("harpoon.ui").nav_next()<cr>', opts)
    vim.keymap.set('n', '<C-c>',          ':lua require("harpoon.ui").nav_prev()<cr>', opts)
    vim.keymap.set('n', '<leader>1',      ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
    vim.keymap.set('n', '<leader>2',      ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
    vim.keymap.set('n', '<leader>3',      ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
  end
}
