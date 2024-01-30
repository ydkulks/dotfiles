--[[
require("speedster.config").setup({
    -- Default values
    num_char = 50,     -- Number of characters displayed
    symbols = 1,       -- Number of words replaced with symbols
    dark_theme = {     -- Dark theme
      Title = 'ctermfg=15',
      Text = 'ctermfg=1',
      Hr = 'ctermfg=1',
      Border = 'ctermfg=1'
    },
    light_theme = {    -- Light theme
      Title = 'guifg=#000000 ctermfg=16',
      Text = 'guifg=#000000 ctermfg=16',
      Hr = 'guifg=#000000 ctermfg=16',
      Border = 'guifg=#3b4048 ctermfg=238'
    }
})
]]
