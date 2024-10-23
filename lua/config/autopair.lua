return {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6',
    opts={
      --Config goes here
    },
    config = function ()
      require'ultimate-autopair'.setup{}
      vim.keymap.set('n', '<leader><F3>', ":lua require'ultimate-autopair'.toggle()<CR>")
    end
}
