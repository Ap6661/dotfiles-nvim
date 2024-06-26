return {
    'williamboman/mason.nvim',
    enabled = vim.fn.executable('nix-shell') ~= 1, -- Only enable if no Nix
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    },
    config = function()
      require("mason").setup()
    end
}
