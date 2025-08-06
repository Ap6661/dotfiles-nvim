if vim.fn.executable('nix-shell') == 1 then
  vim.pack.add({{ src = "https://github.com/dundalek/lazy-lsp.nvim" }})
  require("lazy-lsp").setup {
      prefer_local = true, -- Prefer locally installed servers over nix-shell
      default_config = {
        flags = {
          debounce_text_changes = 150,
        },
      },
      configs = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      },
    }
else
  vim.pack.add({
    { src = 'https://github.com/williamboman/mason.nvim'},
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim'},
  })
  require("mason").setup()
end
