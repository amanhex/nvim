vim.g.mapleader = " "
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)

require('nvim_comment').setup()

-- Key mappings
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })

