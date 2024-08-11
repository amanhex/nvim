local dashboard = require('dashboard')

local logo = [[                                   
                                      ██████                                    
                                      ████▒▒▒▒▒▒████                                
                                    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              
                                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            
                                ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              
                                ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          
                                ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          
                              ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        
                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        
                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        
                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        
                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        
                              ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        
                              ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        
                              ██      ██      ████      ████                        
]]

logo = string.rep("\n", 3) .. logo .. "\n\n"

local center_buttons = {
  {
    icon = "  ",
    desc = "Find File",
    key = "f",
    action = "Telescope find_files",
  },
  {
    icon = "  ",
    desc = "New File",
    key = "n",
    action = "ene | startinsert",
  },
  {
    icon = "  ",
    desc = "Recent Files",
    key = "r",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Find Text",
    key = "g",
    action = "Telescope live_grep",
  },
  {
    icon = "  ",
    desc = "Config",
    key = "c",
    action = "edit ~/.config/nvim/init.lua",
  },
  {
    icon = "󰒲  ",
    desc = "Manage Plugins",
    key = "p",
    action = "Lazy",
  },
  {
    icon = "  ",
    desc = "Quit",
    key = "q",
    action = function() vim.cmd("qa") end,
  },
}

-- Adjust the button formatting for the center items before passing to setup
for _, button in ipairs(center_buttons) do
  button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  button.key_format = "  %s"
end

dashboard.setup({
  theme = "doom",
  hide = {
    statusline = false, -- If you're using lualine or another statusline, set this to false
  },
  config = {
    header = vim.split(logo, "\n"),
    center = center_buttons,
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
  },
})

-- Open the dashboard after closing Lazy (if needed)
if vim.o.filetype == "lazy" then
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(vim.api.nvim_get_current_win()),
    once = true,
    callback = function()
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
      end)
    end,
  })
end

