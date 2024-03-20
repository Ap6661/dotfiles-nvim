return {
  {
    'williamboman/mason.nvim',
    enabled = vim.fn.executable('nix-shell') ~= 1, -- Only enable if no Nix
    branch = 'v2.x',
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    }
  }
}
