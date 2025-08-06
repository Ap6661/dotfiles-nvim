vim.pack.add{{ src =  'https://github.com/nvim-treesitter/nvim-treesitter' }}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "lua",
    "vim",
    "html",
    "markdown",
    "markdown_inline",
    "latex",
    "java"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
