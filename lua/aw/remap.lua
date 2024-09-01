
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<F6>', '<Plug>(IPy-RunAll)', { silent = true })
