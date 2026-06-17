vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvimdev/lspsaga.nvim",
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    }
  }
})

vim.lsp.config("*", { -- Default
  flags = {
    debounce_text_changes = 150,
  },
  root_markers = { '.git', '.hg' },
})
-- =><=

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

vim.lsp.config("lua_ls",
{
  settings = {
    Lua = {
      telemetry = {enable = false},
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library'
        }
      }
    },
  },
})



--- SAGA ---

local saga = require("lspsaga")
saga.setup({
  lightbulb = {
    virtual_text = false,
  }
})

-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', {buffer = bufnr})
-- vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', {buffer = bufnr})
-- vim.keymap.set('n', 'go', '<cmd>Lspsaga peek_type_definition<cr>', {buffer = bufnr})
-- vim.keymap.set('n', '<F2>', '<cmd>Lspsaga rename<cr>', {buffer = bufnr})
-- vim.keymap.set('n', '<F4>', '<cmd>Lspsaga code_action<cr>', {buffer = bufnr})
-- vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>', {buffer = bufnr})
-- vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', {buffer = bufnr})
-- vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', {buffer = bufnr})
-- vim.keymap.set('n', '[D', '<cmd>Lspsaga show_buf_diagnostics<cr>', {buffer = bufnr})
-- vim.keymap.set('n', ']D', '<cmd>Lspsaga show_workspace_diagnostics<cr>', {buffer = bufnr})
