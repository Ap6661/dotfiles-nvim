vim.pack.add({
  { src = 'https://github.com/anuvyklack/windows.nvim' },
  { src = 'https://github.com/anuvyklack/middleclass' },
  { src = 'https://github.com/anuvyklack/animation.nvim' }
})

vim.keymap.set('n', '<Leader>M', ':WindowsMaximize<Cr>', { noremap = true, silent = true } )
vim.keymap.set('n', '<Leader>a', ':WindowsToggleAutowidth<Cr>', { noremap = true, silent = true } )

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false
require('windows').setup()
