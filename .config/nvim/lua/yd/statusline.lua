-- Vim statusbar config
local function git_branch()
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if string.len(branch) > 0 then
      return branch
    else
      return ""
    end
end

-- Temp Vim statusbar config
local function vim_mode()
	local mode =vim.api.nvim_get_mode().mode
	if mode == 'n' then
		-- return 'NORMAL'
		-- return '[ NORMAL ]'
		return ' NORMAL ❯'
	elseif mode == 'v' then
		-- return 'VISUAL'
		-- return '[ VISUAL ]'
		return ' VISUAL ❯'
	elseif mode == 'V' then
		-- return 'V-LINE'
		-- return '[ V-LINE ]'
		return ' V-LINE ❯'
	elseif mode == '^V' then
		-- return 'V-BLOCK'
		-- return '[ V-BLOCK ]'
		return ' V-BLOCK ❯'
	elseif mode == 'i' then
		-- return 'INSERT'
		-- return '[ INSERT ]'
		return ' INSERT ❯'
	elseif mode == 'R' then
		-- return 'REPLACE'
		-- return '[ REPLACE ]'
		return ' REPLACE ❯'
	elseif mode == 'c' then
		-- return 'COMMAND'
		-- return '[ COMMAND ]'
		return ' COMMAND ❯'
	elseif mode == 's' then
		-- return 'SELECT'
		-- return '[ SELECT ]'
		return ' SELECT ❯'
	else
		-- return 'UNKNOWN'
		-- return mode
		-- return '[ ' .. mode .. ' ]'
		return ' ' .. mode .. ' ❯'
	end
end
vim.cmd("set laststatus=3") -- Global statusbar
vim.cmd("set noshowmode") -- Disable display of mode in cmd mode line

local git = git_branch()
local function update_statusline()
	local cmd = vim.cmd
	-- Green
	-- cmd("highlight StatusLine ctermfg=235 ctermbg=114 guifg=#292d3e guibg=#c3e88d")
	-- cmd("highlight StatusLineIcon ctermfg=114 guifg=#c3e88d")

	-- Minimal Color
	cmd("highlight StatusLine ctermfg=204 ctermbg=235 guifg=#292d3e guibg=#3e4452")
	cmd("highlight StatusLineIcon ctermfg=235 guifg=#3e4452")

	-- local fg = "ctermfg=114 guifg=#c3e88d"
	-- local bg = "ctermbg=238 guibg=#3b4048"

	-- local fg = "ctermfg=114 guifg=#c3e88d"
	-- local bg = "ctermbg=235 guibg=#292d3e"
	-- cmd("highlight StatusLine ".. bg .. " " .. fg)
	-- cmd("highlight StatusLineIcon ctermfg=238 guifg=#3b4048")

	local set_color_0 = "%#StatusLine#"
	-- local set_color_0_1 = "%#StatusLineIcon#"
  -- local set_color_1 = "%#DiagnosticHint#"
  local set_color_1 = "%#@comment#"
	local mode = vim_mode()
  local set_color_2 = "%#@comment#"
  local file_name = " %f"
  local modified = "%m"
  local align_right = "%="
  local filetype = " %y"
  local percentage = " %p%%"
  local linecol = " %l:%c"

  local statubar_str = string.format(
    -- "%s %s %s%s%s%s %s%s%s%s%s%s",
    "%s%s%s%s %s%s%s%s%s%s",
		set_color_0,
		mode,
		-- '[ ' .. git .. ' ]',
		-- set_color_0_1,
    -- '',
		set_color_1,
    file_name,
    modified,
		set_color_2,
    align_right,
    percentage,
    linecol,
    filetype
  )
	return statubar_str
end

local group = vim.api.nvim_create_augroup("VimModeRefresh", {clear = true})
vim.api.nvim_create_autocmd({"ModeChanged","BufEnter"}, {
	callback = function ()
		vim.opt.statusline = update_statusline()
		-- git = git_branch()
	end,
	group = group
})
