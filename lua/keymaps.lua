-- Common Options
local opts = {
  noremap = true,
  silent = true,
}


------------
-- Normal --
------------
-- No More Help!
vim.keymap.set('', '<F1>', '<nop>', opts)
vim.keymap.set('i', '<F1>', '<nop>', opts)

-- Better Movement
vim.keymap.set('n', 'L', 'Lzz', opts)
vim.keymap.set('n', 'H', 'Hzz', opts)

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Terminal
if vim.fn.has('win32') == 1 then
  vim.keymap.set('n', '<Leader>t', ':vert bo new +term\\ powershell | set nonumber norelativenumber<cr>iclear<cr>', opts)
else
  vim.keymap.set('n', '<Leader>t', ':vert bo new +term\\ ' .. vim.opt.shell:get() .. ' | set nonumber norelativenumber<cr>iclear<cr>', opts)
end

vim.keymap.set({'t', 'n'}, '<C-\\><C-\\>', '<C-\\><C-N>', opts)


-- Set spell check
vim.keymap.set('n', '<leader>ss', ':setlocal spell!<cr>', opts)

-- Paste and Yank from clipboard
vim.keymap.set('n', '<leader>p', '"+p', opts)
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', opts)

-- Delete All Buffers Except This One
vim.keymap.set('n', '<leader>bd', ':%bd|e#|bd#<CR>', opts)

------------
-- Visual --
------------
-- Start Visual with the same area
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


-----------
-- Mouse --
-----------
-- Disable arrow keys
for _, mode in ipairs({ 'n', 'v', 'i' }) do
  for _, dir in ipairs({ 'Up', 'Down' }) do
    vim.keymap.set(mode, '<' .. dir .. '>', '<Nop>', { silent = true })
  end
end

-- Toggle Mouse 
vim.opt.mouse = ''
vim.keymap.set('', '<leader><F2>', function ()
  if vim.api.nvim_get_option_value("mouse", { scope = "global" }) ~= "" then
    vim.opt.mouse = ''
  else
    vim.opt.mouse = 'a'
  end
end)
