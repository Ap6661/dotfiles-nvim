require('options')
require('keymaps')



for _, file in ipairs(vim.fn.readdir(vim.opt.runtimepath:get()[1] .. '/lua/plugins', [[v:val =~ '\.lua$']])) do
  require('plugins.'..file:gsub('%.lua$', ''))
end

