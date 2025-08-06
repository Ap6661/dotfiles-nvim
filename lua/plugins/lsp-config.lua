vim.pack.add({{ src = "https://github.com/neovim/nvim-lspconfig" }})

vim.cmd "set completeopt+=noselect"
vim.api.nvim_create_autocmd('LSPAttach', {
  callback = function (ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end})
  
