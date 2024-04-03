return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      -- LSP Saga
      { 'nvimdev/lspsaga.nvim',
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
      },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})
      local saga = require("lspsaga")
      saga.setup()

---@diagnostic disable-next-line: unused-local
      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({ buffer = bufnr })
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', {buffer = bufnr})
        vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', {buffer = bufnr})
        vim.keymap.set('n', 'go', '<cmd>Lspsaga peek_type_definition<cr>', {buffer = bufnr})
        vim.keymap.set('n', '<F2>', '<cmd>Lspsaga rename<cr>', {buffer = bufnr})
        vim.keymap.set('n', '<F4>', '<cmd>Lspsaga code_action<cr>', {buffer = bufnr})
        vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>', {buffer = bufnr})
        vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', {buffer = bufnr})
        vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', {buffer = bufnr})
        vim.keymap.set('n', '[D', '<cmd>Lspsaga show_buf_diagnostics<cr>', {buffer = bufnr})
        vim.keymap.set('n', ']D', '<cmd>Lspsaga show_workspace_diagnostics<cr>', {buffer = bufnr})

      end)

      lsp.set_sign_icons({
        error = '',
        warn = '▲',
        hint = '',
        info = '',
      })

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
      lsp.setup()

      local cmp = require('cmp')
      cmp.setup({
        source = {
          {name = 'nvim_lsp'},
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
          ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end
  }
}
