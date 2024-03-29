return {
  "echasnovski/mini.nvim",
  version = false,
  config = function ()
    local opts = {
      noremap = true,
      silent = true,
    }
    require("mini.indentscope").setup()

    require("mini.map").setup()
    vim.keymap.set('n', '<Leader>m', ":lua MiniMap.toggle()<CR>", opts)

    require("mini.tabline").setup()

    require("mini.comment").setup()

    require("mini.notify").setup()

    require("mini.trailspace").setup()

    require("mini.jump2d").setup()

    require("mini.pick").setup()
    vim.keymap.set('n', '<Leader>ff', ":Pick ", {noremap = true})

    require("mini.files").setup()
    vim.keymap.set('n', '<Leader>-', function() MiniFiles.open() end, opts)

    require("mini.cursorword").setup()
    vim.keymap.set('n', '<Leader>cw', function()
      vim.g.minicursorword_disable = vim.g.minicursorword_disable == false
    end, opts)

    vim.g.minicursorword_disable = true
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }
}
