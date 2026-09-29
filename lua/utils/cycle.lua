local M = {}

--@param rhs fun()[]
function M.new(rhs)
  assert(type(rhs) == "table" and #rhs > 0, "cycle.new requires a non-empty list")

  local index = 0

  -- vim.keymap.set(modes, lhs, 
  return function()
    index = (index % #rhs) + 1
    rhs[index]()
  end
  -- , opts)
end

return M
