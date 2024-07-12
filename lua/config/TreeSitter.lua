return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "lua",
        "vim",
        "html",
        "markdown",
        "markdown_inline",
        "java"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
    }
  end
}
