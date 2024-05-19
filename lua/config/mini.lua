return {
  "echasnovski/mini.nvim",
  version = false,
  config = function ()
    local opts = {
      noremap = true,
      silent = true,
    }
    -- Highlight Indent Block
    require("mini.indentscope").setup({
      symbol = "┊"
    })

    -- A little MiniMap to over view code with <Leader>m
    require("mini.map").setup()
    vim.keymap.set('n', '<Leader>m', ":lua MiniMap.toggle()<CR>", opts)

    -- Tab line with buffers
    require("mini.tabline").setup()

    -- Toggle a line as comments with gcc
    require("mini.comment").setup()

    -- Jump anywhere with <Leader><CR>
    require("mini.jump2d").setup({
      mappings = {
        start_jumping = "<Leader><CR>",
      },
    })
    -- Picker ( help, buffer, grep, etc )
    require("mini.extra").setup()
    require("mini.pick").setup({ window = { config = { border = 'rounded' } } })
    vim.keymap.set('n', '<Leader>ff', ":Pick ", {noremap = true})

    -- File Explorer <Leader>-
    require("mini.files").setup()
    vim.keymap.set('n', '<Leader>-', function() MiniFiles.open() end, opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id
        vim.api.nvim_win_set_config(win_id, { border = 'rounded' })
      end,
    })

    -- Underline Cursor Word, Toggle with <Leader>cw
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
