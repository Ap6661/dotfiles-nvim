vim.pack.add({ { src = "https://github.com/benlubas/molten-nvim" } })

vim.g.molten_auto_open_output = false
vim.g.molten_virt_text_output = true
vim.g.molten_tick_rate = 200
vim.g.molten_wrap_output = false

local function project_kernel_names()
  local jp = os.getenv("JUPYTER_PATH")
  if not jp or jp == "" then
    return {}
  end
  local names = {}
  for _, base in ipairs(vim.split(jp, ":")) do
    local dir = vim.fs.joinpath(base, "kernels")
    if vim.fs.dir(dir) then
      for name in vim.fs.dir(dir) do
        table.insert(names, name)
      end
    end
  end
  return names
end

local function init_env_kernel()
  local env = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if env then
    local name = env:match("/([^/]+)/?$") or env
    if pcall(vim.cmd, ("MoltenInit %s"):format(name)) then
      return
    end
  end

  local names = project_kernel_names()
  if #names == 1 then
    if pcall(vim.cmd, ("MoltenInit %s"):format(names[1])) then
      return
    end
  end

  vim.cmd("MoltenInit")
end

vim.keymap.set("n", "<localleader>mi", init_env_kernel, { desc = "molten init (project env)" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { desc = "evaluate line", silent = true })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-evaluate cell", silent = true })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "evaluate visual selection", silent = true })
vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { desc = "delete cell", silent = true })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "hide output", silent = true })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "show/enter output", silent = true })
vim.keymap.set("n", "<localleader>oi", ":MoltenInterrupt<CR>", { desc = "interrupt kernel", silent = true })
vim.keymap.set("n", "<localleader>rs", ":MoltenRestart<CR>", { desc = "restart kernel", silent = true })
