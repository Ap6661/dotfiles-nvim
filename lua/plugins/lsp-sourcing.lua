if vim.fn.executable('nix-shell') == 1 then
  vim.pack.add({
    { src = "https://github.com/dundalek/lazy-lsp.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
  })
  require("lazy-lsp").setup {
      use_vim_lsp_config = true,
      prefer_local = false, -- Prefer locally installed servers over nix-shell

      excluded_servers = {
        "clangd",
        "sourcekit",
        "pylyzer"
      },

      preferred_servers = {
        nix = { "nixd" },
        c = { "ccls" },
        cpp = { "ccls" },
      },

      configs = {
        r_language_server = {
          filetypes = { 'r' }
        }
      }
    }
else
  vim.pack.add({
    { src = 'https://github.com/williamboman/mason.nvim'},
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim'},
  })
  require("mason").setup()
end
