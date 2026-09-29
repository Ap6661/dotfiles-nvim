
-------------
-- Keymaps -- 
-------------

------------
-- Insert -- 
------------

-- Pop-up Menu Keybinds
for _, i in pairs({
  { key = '<Tab>'    , map = '<Down>' },
  { key = '<S-Tab>'  , map = '<Up>'   },
  { key = '<CR>'     , map = '<C-y>'  },
  { key = '<S-Esc>'  , map = '<C-e>'  },
}) do
local prev = vim.fn.maparg(i.key, "i", false, true)

vim.keymap.set('i', i.key, function()
  -- return vim.fn.pumvisible() == 1 and i.map or i.key
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes(i.map, true, false, true)
  end

  if prev.callback then
    return vim.api.nvim_replace_termcodes(prev.callback(), true, false, true)
  end

  if prev.rhs and prev.rhs ~= "" then
    return vim.fn.eval(prev.rhs)
  end

  return vim.api.nvim_replace_termcodes(i.key, true, false, true)
end, {
noremap = true,
expr = true,
replace_keycodes = false
})
end
