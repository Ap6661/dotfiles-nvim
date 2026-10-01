vim.pack.add({
  { src = "https://github.com/quarto-dev/quarto-nvim" },
  { src = "https://github.com/jmbuhr/otter.nvim" },
})

require("quarto").setup({
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "python" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = true,
    default_method = "molten",
    ft_runners = {},
    never_run = { "yaml" },
  },
})

local runner = require("quarto.runner")
local quarto = require("quarto")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "quarto",
  callback = function(ev)
    local b = ev.buf
    vim.keymap.set("n", "<localleader>rc", runner.run_cell, { buffer = b, desc = "run cell", silent = true })
    vim.keymap.set("n", "<localleader>ra", runner.run_above, { buffer = b, desc = "run cell and above", silent = true })
    vim.keymap.set("n", "<localleader>rA", runner.run_all, { buffer = b, desc = "run all cells", silent = true })
    vim.keymap.set("n", "<localleader>rl", runner.run_line, { buffer = b, desc = "run line", silent = true })
    vim.keymap.set("v", "<localleader>r", runner.run_range, { buffer = b, desc = "run visual range", silent = true })
    vim.keymap.set("n", "<localleader>qp", quarto.quartoPreview, { buffer = b, desc = "quarto preview", silent = true })
    vim.keymap.set("n", "<localleader>qc", quarto.quartoClosePreview, { buffer = b, desc = "close preview", silent = true })
    vim.keymap.set("n", "<localleader>qr", ":!quarto render %<CR>", { buffer = b, desc = "render document", silent = true })

    vim.keymap.set("n", "<localleader>qs",
    require('utils.cycle').new({
      function ()
        vim.o.syntax=''
        vim.treesitter.start()
      end,
      function ()
        vim.o.syntax='quarto'
        vim.treesitter.start()
      end
    }), { buffer = b, desc = "toggle quarto treesitter", silent = true })
  end,
})
