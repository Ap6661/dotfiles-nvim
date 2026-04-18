require('options')
require('keymaps')


local first = vim.fn.stdpath('config_dirs')[1]
local config = string.find(first, "/nix/") == nil and vim.fn.stdpath('config') or first
local plugin_dir = config .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(plugin_dir, [[v:val =~ '\.lua$']])) do
  require('plugins.'..file:gsub('%.lua$', ''))
end

