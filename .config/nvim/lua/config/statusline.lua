vim.cmd("set laststatus=3") -- Global statusbar
vim.cmd("set noshowmode")   -- Disable display of mode in cmd mode line
-- local function git_branch()
--     local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
--     if string.len(branch) > 0 then
--       return branch
--     else
--       return ""
--     end
-- end

local function colorScheme(color)
  if color == "Blue" then
    -- Blue
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=33 cterm=bold guifg=#292d3e guibg=#7aa2f7 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#7aa2f7")
  elseif color == "Yellow" then
    -- Yellow
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=226 cterm=bold guifg=#292d3e guibg=#ff9e64 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#ff9e64")
  elseif color == "Green" then
    -- Green
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#98c379 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#98c379")
  elseif color == "Purple" then
    -- Purple
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#bb9af7 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#bb9af7")
  elseif color == "Red" then
    -- Red
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=226 cterm=bold guifg=#292d3e guibg=#f7768e gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#f7768e")
  elseif color == "White" then
    -- White
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#c0caf5 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#c0caf5")
  end
end

-- Temp Vim statusbar config
local function vim_mode()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'n' then
    colorScheme("Blue")
    return 'NORMAL'
  elseif mode == 'v' then
    colorScheme("Yellow")
    print(" ")
    return 'VISUAL'
  elseif mode == 'V' then
    colorScheme("Yellow")
    print(" ")
    return 'V-LINE'
  elseif mode == '^V' then
    colorScheme("Yellow")
    print(" ")
    return 'V-BLOCK'
  elseif mode == 'i' then
    colorScheme("Green")
    print(" ")
    return 'INSERT'
  elseif mode == 'R' then
    colorScheme("Purple")
    print(" ")
    return 'REPLACE'
  elseif mode == 'c' then
    colorScheme("Red")
    print(" ")
    return 'COMMAND'
  elseif mode == 's' then
    colorScheme("Yellow")
    print(" ")
    return 'SELECT'
  elseif mode == 'no' then
    colorScheme("Purple")
    print(" ")
    return 'CHANGE'
  else
    colorScheme("White")
    print(" ")
    -- return 'UNKNOWN'
    return mode
  end
end

-- local git = git_branch()
local function update_statusline()
  colorScheme("Blue")

  local set_color_0 = "%#StatusLine#"
  local set_color_0_1 = "%#StatusLineIcon#"
  local set_color_1 = "%#@comment#"
  local mode = vim_mode()
  local set_color_2 = "%#@comment#"
  local file_name = " %f"
  local modified = "%m"
  local align_right = "%="
  local filetype = " %Y " -- returns "filetype"
  local percentage = " %p%%"
  local linecol = " %l:%c "

  local format = "%s %s %s%s%s%s %s%s%s%s%s%s%s%s%s"
  local statubar_str = string.format(
    format,
    set_color_0,
    mode,
    set_color_0_1,
    '',
    set_color_1,
    file_name,
    modified,
    set_color_2,
    align_right,
    percentage,
    linecol,
    set_color_0_1,
    '',
    set_color_0,
    filetype
  )
  return statubar_str
end

local group = vim.api.nvim_create_augroup("VimModeRefresh", { clear = true })
vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter" }, {
  callback = function()
    vim.opt.statusline = update_statusline()
    -- git = git_branch()
  end,
  group = group
})
