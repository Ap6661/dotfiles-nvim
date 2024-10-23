return {
    -- My Librecode helpers
    'targetdisk/minitator',
    config = function ()
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
                pattern = {"*.annotated.head.json"},
                command = "call minitator#macros()",
                })
    end
}
