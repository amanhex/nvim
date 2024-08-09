-- require("gruvbox").setup {
--     transparent_mode = true,
--   }
--  
--   vim.o.background = "dark"
--   vim.cmd "colorscheme gruvbox"

local ok, _ = pcall(vim.cmd, 'colorscheme arctic')
if not ok then
  vim.cmd 'colorscheme default' -- if the above fails, then use default
end
