return {
  'anuvyklack/windows.nvim',
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim"
  },
  config = function()
    vim.keymap.set('n', '<Leader>M', ':WindowsMaximize<Cr>', { noremap = true, silent = true } )

    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup()
   end

}
