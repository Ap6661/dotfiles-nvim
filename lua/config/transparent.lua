return {
  'xiyaowong/transparent.nvim',
  config = function ()
    vim.keymap.set('n', '<Leader>o', ':TransparentToggle<Cr>',
      { noremap = true, silent = true })
  end
}
