
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>b", vim.cmd.bnext)
vim.keymap.set("n", "<leader>t", vim.cmd.tabnext)
vim.api.nvim_set_keymap('n', '<F6>', '<Plug>(IPy-RunAll)', { silent = true })
