vim.pack.add({
  { src = 'https://github.com/romus204/tree-sitter-manager.nvim'},
})

require("tree-sitter-manager").setup()

vim.cmd "TSInstall bash nix lua markdown markdown_inline python r"
