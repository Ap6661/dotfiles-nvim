vim.pack.add({{ src = 'https://github.com/altermo/ultimate-autopair.nvim' }})

require'ultimate-autopair'.setup{}
vim.keymap.set('n', '<leader><F3>', ":lua require'ultimate-autopair'.toggle()<CR>")
