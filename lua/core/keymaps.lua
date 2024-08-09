local builtin = require "telescope.builtin"
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("i", "jk", "<esc>", { noremap = true })
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })

-- for comments
require "plugins.comments"
vim.api.nvim_set_keymap('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })

-- for splits
vim.keymap.set("n", "<leader>vs", ":vsp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>hs", ":sp<CR>", { noremap = true, silent = true })

-- for buffers
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR>', { noremap = true, silent = true })
