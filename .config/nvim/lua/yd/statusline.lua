local vim = vim
vim.cmd("set laststatus=3") -- Global statusbar
vim.cmd("set noshowmode") -- Disable display of mode in cmd mode line
-- local function git_branch()
--     local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
--     if string.len(branch) > 0 then
--       return branch
--     else
--       return ""
--     end
-- end
-- Temp Vim statusbar config
local function vim_mode()
	local mode =vim.api.nvim_get_mode().mode
	if mode == 'n' then
		return 'NORMAL'
	elseif mode == 'v' then
    print(" ")
		return 'VISUAL'
	elseif mode == 'V' then
    print(" ")
		return 'V-LINE'
	elseif mode == '^V' then
    print(" ")
		return 'V-BLOCK'
	elseif mode == 'i' then
    print(" ")
		return 'INSERT'
	elseif mode == 'R' then
    print(" ")
		return 'REPLACE'
	elseif mode == 'c' then
		return 'COMMAND'
	elseif mode == 's' then
    print(" ")
		return 'SELECT'
	else
    print(" ")
		return 'UNKNOWN'
		-- return mode
	end
end

-- local git = git_branch()
local function update_statusline()
	local cmd = vim.cmd
	-- Green
	cmd("highlight StatusLine ctermfg=235 ctermbg=114 cterm=bold guifg=#292d3e guibg=#98c379 gui=bold")
	cmd("highlight StatusLineIcon ctermfg=114 guifg=#98c379")

	-- Red (Minimal Color)
	-- cmd("highlight StatusLine ctermfg=204 ctermbg=235 guifg=#292d3e guibg=#3e4452")
	-- cmd("highlight StatusLineIcon ctermfg=235 guifg=#3e4452")

	local set_color_0 = "%#StatusLine#"
	local set_color_0_1 = "%#StatusLineIcon#"
  -- local set_color_1 = "%#DiagnosticHint#"
  local set_color_1 = "%#@comment#"
	local mode = vim_mode()
  local set_color_2 = "%#@comment#"
  local file_name = " %f"
  local modified = "%m"
  local align_right = "%="
  -- local red_filetype = "%y" -- returns "[filetype]"
  local green_filetype = " %Y " -- returns "filetype"
  local percentage = " %p%%"
  local linecol = " %l:%c "

  local green_format = "%s %s %s%s%s%s %s%s%s%s%s%s%s%s%s"
  -- local red_format = "%s%s%s%s %s%s%s%s%s%s"
  local statubar_str = string.format(
  -- Green
    -- "%s %s %s%s%s%s %s%s%s%s%s%s",
    green_format,
		set_color_0,
		mode,
		set_color_0_1,
    '',
    -- ' [ ' .. git .. ' ]',
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
    green_filetype

    -- Red(Minimal)
    -- -- "%s%s%s%s %s%s%s%s%s%s",
    -- red_format,
		-- set_color_0,
		-- " " .. mode .. " ❯",
		-- set_color_1,
    -- file_name,
    -- modified,
		-- set_color_2,
    -- align_right,
    -- percentage,
    -- linecol,
    -- red_filetype
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
