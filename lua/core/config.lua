local opt = vim.opt
local api = vim.api

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.encoding = "utf-8"
opt.swapfile = false
opt.scrolloff = 7
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.wrap = false
opt.clipboard = "unnamedplus"
opt.termguicolors = true

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
