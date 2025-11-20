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

-- FIX: Load color_palette conditionally
local color_palette = {
  ["default"] = {
    background = "#1E2127",
    foreground = "#EBEEF4",
    black = "#30353F",
    blue = "#85A4C3",
    cyan = "#8CC1D1",
    green = "#A6BF91",
    purple = "#82819F",
    red = "#C06771",
    white = "#E4E8F0",
    yellow = "#EACC90",
    brightBlack = "#535D71",

    -- black = "#2A2A2A",
    -- blue = "#85C1FC",
    -- cyan = "#88C0D0",
    -- green = "#A3BE8C",
    -- purple = "#AA9BF5",
    -- red = "#BF616A",
    -- white = "#D8DEE9",
    -- yellow = "#EFB080",
    -- background = "#1A1A1A",
    -- foreground = "#D8DEE9",
  },
  ["cursor_dark"] = {
    background = "#1A1A1A",
    foreground = "#D8DEE9",
    black = "#2A2A2A",
    blue = "#85C1FC",
    cyan = "#88C0D0",
    green = "#A3BE8C",
    purple = "#AA9BF5",
    red = "#BF616A",
    white = "#D8DEE9",
    yellow = "#EFB080",
    brightBlack = "#505050",
  },
  ["cursor_dark-midnight"] = {
    background = "#282c34",
    foreground = "#abb2bf",
    black = "#282c34",
    blue = "#61afef",
    cyan = "#56b6c2",
    green = "#98c379",
    purple = "#c678dd",
    red = "#e06c75",
    white = "#abb2bf",
    yellow = "#e5c07b",
    brightBlack = "#5c6370",
  }
}
local current_colorscheme = color_palette[vim.g.colors_name] or color_palette["default"]
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     current_colorscheme = color_palette[vim.g.colors_name] or color_palette["default"]
--   end,
-- })

-- Change the color of the statusline dynamically based on the current mode
---@param color "Blue" | "Yellow" | "Green" | "Purple" | "Red" | "White"
local function colorScheme(color)
  if color == "Blue" then
    -- Blue
    vim.api.nvim_set_hl(0, "StatusLine", { fg = current_colorscheme.background, bg = current_colorscheme.blue, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineIcon", { fg = current_colorscheme.blue, bg = current_colorscheme.background })
  elseif color == "Yellow" then
    -- Yellow
    vim.api.nvim_set_hl(0, "StatusLine", { fg = current_colorscheme.background, bg = current_colorscheme.yellow, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineIcon", { fg = current_colorscheme.yellow, bg = current_colorscheme.background })
  elseif color == "Green" then
    -- Green
    vim.api.nvim_set_hl(0, "StatusLine", { fg = current_colorscheme.background, bg = current_colorscheme.green, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineIcon", { fg = current_colorscheme.green, bg = current_colorscheme.background })
  elseif color == "Purple" then
    -- Purple
    vim.api.nvim_set_hl(0, "StatusLine", { fg = current_colorscheme.background, bg = current_colorscheme.purple, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineIcon", { fg = current_colorscheme.purple, bg = current_colorscheme.background })
  elseif color == "Red" then
    -- Red
    vim.api.nvim_set_hl(0, "StatusLine", { fg = current_colorscheme.background, bg = current_colorscheme.red, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineIcon", { fg = current_colorscheme.red, bg = current_colorscheme.background })
  elseif color == "White" then
    -- White
    vim.api.nvim_set_hl(0, "StatusLine", { fg = current_colorscheme.background, bg = current_colorscheme.white, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineIcon", { fg = current_colorscheme.white, bg = current_colorscheme.background })
  end
  vim.api.nvim_set_hl(0, "StatusLineComment", { fg = current_colorscheme.brightBlack, bg = current_colorscheme.background })
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
