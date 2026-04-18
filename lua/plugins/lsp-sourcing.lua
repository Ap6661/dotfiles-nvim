if vim.fn.executable('nix-shell') == 1 then
  vim.pack.add({{ src = "https://github.com/dundalek/lazy-lsp.nvim" }})
  require("lazy-lsp").setup {
      use_vim_lsp_config = true,
      prefer_local = false, -- Prefer locally installed servers over nix-shell
    }
    vim.lsp.configs("*", -- Default
      {
        flags = {
          debounce_text_changes = 150,
        },
      }
    )
    vim.lsp.configs("lua_ls",
      {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
    )
else
  vim.pack.add({
    { src = 'https://github.com/williamboman/mason.nvim'},
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim'},
  })
  require("mason").setup()
end
