vim.cmd("set laststatus=3") -- Global statusbar
vim.cmd("set noshowmode")   -- Disable display of mode in cmd mode line

-- Get current git branch based on the current buffer's file
local function git_branch()
  local filename = vim.api.nvim_buf_get_name(0) -- Get the full path of the current buffer's file
  if filename == "" or vim.bo.buftype ~= "" then
    return ""                                   -- Not a file buffer or special buffer type
  end

  local dirname = vim.fn.fnamemodify(filename, ":h") -- Get the directory of the file

  -- Find the Git repository root from the file's directory
  local git_root = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel 2>/dev/null | tr -d '\n'",
    vim.fn.shellescape(dirname)))

  if string.len(git_root) == 0 then
    return "" -- Not in a Git repository
  end

  -- Get the branch name from the Git root
  local branch = vim.fn.system(string.format("git -C %s rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'",
    vim.fn.shellescape(git_root)))

  if string.len(branch) > 0 then
    return "  " .. branch
  else
    return ""
  end
end

-- Change the color of the statusline dynamically based on the current mode
---@param color "Blue" | "Yellow" | "Green" | "Purple" | "Red" | "White"
local function colorScheme(color)
  if color == "Blue" then
    -- Blue
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=33 cterm=bold guifg=#292d3e guibg=#7aa2f7 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#7aa2f7 guibg=#1B1C27")
  elseif color == "Yellow" then
    -- Yellow
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=226 cterm=bold guifg=#292d3e guibg=#ff9e64 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#ff9e64 guibg=#1B1C27")
  elseif color == "Green" then
    -- Green
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#98c379 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#98c379 guibg=#1B1C27")
  elseif color == "Purple" then
    -- Purple
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#bb9af7 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#bb9af7 guibg=#1B1C27")
  elseif color == "Red" then
    -- Red
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=226 cterm=bold guifg=#292d3e guibg=#f7768e gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#f7768e guibg=#1B1C27")
  elseif color == "White" then
    -- White
    vim.cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#c0caf5 gui=bold")
    vim.cmd("highlight StatusLineIcon ctermfg=114 guifg=#c0caf5 guibg=#1B1C27")
  end
  vim.cmd("highlight StatusLineComment gui=italic guifg=#565f89 guibg=#1B1C27 cterm=italic ctermbg=NONE")
  -- vim.api.nvim_set_hl(0, "StatusLineSecendery", { bg = "#565f89", fg = "#565f89" })
end

-- Temp Vim statusbar config
local function vim_mode()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'n' then
    colorScheme("Blue")
    return 'NORMAL'
  elseif mode == 'v' then
    colorScheme("Yellow")
    -- print(" ")
    return 'VISUAL'
  elseif mode == 'V' then
    colorScheme("Yellow")
    -- print(" ")
    return 'V-LINE'
  elseif mode == '^V' then
    colorScheme("Yellow")
    -- print(" ")
    return 'V-BLOCK'
  elseif mode == 'i' then
    colorScheme("Green")
    -- print(" ")
    return 'INSERT'
  elseif mode == 'R' then
    colorScheme("Purple")
    -- print(" ")
    return 'REPLACE'
  elseif mode == 'c' then
    colorScheme("Red")
    -- print(" ")
    return 'COMMAND'
  elseif mode == 's' then
    colorScheme("Yellow")
    -- print(" ")
    return 'SELECT'
  elseif mode == 'no' then
    colorScheme("Purple")
    -- print(" ")
    return 'CHANGE'
  else
    colorScheme("White")
    -- print(" ")
    -- return 'UNKNOWN'
    return mode
  end
end

-- Status line content and formatting
local function update_statusline()
  local git = git_branch()
  colorScheme("Blue")

  local modefg = "%#StatusLine#"
  local modebg = "%#StatusLineIcon#"
  -- local set_color_1 = "%#@comment#"
  local commentfg = "%#StatusLineComment#"
  local mode = " " .. vim_mode() .. " "
  -- if file name is empty, use file path instead
  local file = " %t"
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    file = " %f"
  end
  -- local file_path = " %f"
  local modified = " %m"
  local align_right = "%="
  local filetype = " %Y " -- TODO: add devicons
  local percentage = " %p%% "
  local linecol = " %l:%c"
  local brackets = { '', '', '', ' ' }

  local statusbar_str = modebg .. brackets[2] .. modefg .. mode .. modebg .. brackets[1] ..
      git .. commentfg .. file .. modified ..
      -- file .. modified .. commentfg .. git ..
      commentfg ..
      align_right .. linecol .. modebg .. percentage .. brackets[2] .. modefg .. filetype .. modebg .. brackets[1]
  return statusbar_str
end

local group = vim.api.nvim_create_augroup("VimModeRefresh", { clear = true })
vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter" }, {
  callback = function()
    vim.opt.statusline = update_statusline()
  end,
  group = group
})
