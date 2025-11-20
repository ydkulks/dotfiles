local fn = vim.fn

local color_palette = {
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
}
vim.api.nvim_set_hl(0, "TabLine", { fg = color_palette.brightBlack, bg = color_palette.background, italic = true })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = color_palette.white, bg = color_palette.background, bold = true, italic = true })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = color_palette.background })

-- Store options directly, or make them a local table
-- M.options = {
--   show_index = true,
--   show_modify = true,
--   show_icon = false,
--   fnamemodify = ':t',
--   brackets = { '[', ']' },
--   no_name = 'No Name',
--   modify_indicator = ' [+]',
--   inactive_tab_max_length = 0,
-- }
local options = {
  show_index = true,
  show_modify = true,
  show_icon = true,
  fnamemodify = ':t',
  brackets = { '', '' },
  -- brackets = { '', '' },
  -- brackets = { '', '' },
  no_name = '[No Name]',
  modify_indicator = ' ●',
  inactive_tab_max_length = 0,
}

-- Check for devicons once
local has_devicons, devicons = pcall(require, 'nvim-web-devicons')

-- Tab status
local function isTabActive(index)
  if index == fn.tabpagenr() then
    -- return { true, '%#TabLineSel#' }
    return { true, '%#StatusLine#' }
  else
    return { false, '%#TabLine#' }
  end
end

local function generate_tabline_string(opts)
  local s = ''

  for index = 1, fn.tabpagenr('$') do
    local winnr = fn.tabpagewinnr(index)
    local buflist = fn.tabpagebuflist(index)
    local bufnr = buflist[winnr]
    local bufname = fn.bufname(bufnr)
    local bufmodified = fn.getbufvar(bufnr, '&mod')

    s = s .. '%' .. index .. 'T'
    -- s = s .. isTabActive(index)[2]
    -- s = s .. '%#TabLineSel#'
    s = s .. ' '

    -- index
    if opts.show_index then
      s = s .. '%#StatusLineIcon#' .. index .. ' '
    end

    s = s .. isTabActive(index)[2]

    -- icon
    local icon = ''
    -- local icon_color = ''
    local ext = nil
    if opts.show_icon and has_devicons then
      local base_name = fn.fnamemodify(bufname, ":t")
      ext = fn.fnamemodify(bufname, ':e')

      icon = devicons.get_icon(base_name, ext, { default = true }) .. ' '
      -- icon = devicons.get_icon_by_filetype(base_name) .. ' '

      -- icon color
      -- if ext == nil or ext == '' then -- File extension not found
      --   -- _, icon_color = devicons.get_icon_color(base_name, nil, {})
      --   -- icon_color = '%#' .. icon_color .. "#"
      --   print(devicons.get_icon_colors_by_filetype(base_name, {}))
      -- end
      -- if ext ~= nil then -- File extension found
      --   icon_color = '%#DevIcon' .. ext .. "#"
      -- end
    end

    -- First bracket
    if isTabActive(index)[1] then
      s = s .. '%#StatusLineIcon#' .. opts.brackets[1] .. isTabActive(index)[2]
    end

    -- buf name
    local pre_title_s_len = string.len(s)
    if bufname ~= '' then
      if type(opts.fnamemodify) == 'function' then
        s = s .. icon .. opts.fnamemodify(bufname)
      else
        -- local reset_color = isTabActive(index)[2]
        -- s = s .. icon_color .. icon .. "%#TabLine#" .. fn.fnamemodify(bufname, opts.fnamemodify)
        -- if not isTabActive(index)[1] then
        --   icon_color = ''
        -- end
        -- s = s .. icon_color .. icon .. reset_color .. fn.fnamemodify(bufname, opts.fnamemodify)
        s = s .. icon .. fn.fnamemodify(bufname, opts.fnamemodify)
      end
    else
      s = s .. opts.no_name
    end
    if
        opts.inactive_tab_max_length
        and opts.inactive_tab_max_length > 0
        and index ~= fn.tabpagenr()
    then
      s = string.sub(
        s,
        1,
        pre_title_s_len + opts.inactive_tab_max_length
      )
    end

    -- modify indicator
    if
        bufmodified == 1
        and opts.show_modify
        and opts.modify_indicator ~= nil
    then
      s = s .. opts.modify_indicator
    end

    -- Second Bracket
    if isTabActive(index)[1] then
      -- s = s .. opts.brackets[2]
      s = s .. '%#StatusLineIcon#' .. opts.brackets[2] .. '%#TabLineFill#'
    end

    -- additional space at the end of each tab segment
    s = s .. ' '
  end

  s = s .. '%#TabLineFill#'
  return s
end

-- The setup function for users to call (optional, but good practice)
-- This allows you to override default options easily from init.lua
local function setup_tabline(user_options)
  -- Merge user options with defaults
  options = vim.tbl_extend('force', options, user_options or {})

  -- Define the global function that Neovim's 'tabline' option will call
  -- This needs to be global because 'tabline' option expects a global function name.
  _G.nvim_custom_tabline = function()
    return generate_tabline_string(options)
  end

  -- Set the tabline option to call our global function
  vim.opt.tabline = '%!v:lua.nvim_custom_tabline()'

  -- You might not need this if not distributing as a plugin
  vim.g.loaded_custom_tabline = 1
end

setup_tabline()

-- -- If you want to allow this file to be 'required' and its setup function called
-- -- you can return the setup function.
-- return {
--   setup = setup_tabline,
--   -- You could also return the options table or other functions if needed
--   -- options = options,
-- }

-- Example config:
-- custom_tabline.setup({
--   show_index = true,
--   show_modify = true,
--   show_icon = true, -- Set to true if you have nvim-web-devicons installed
--   fnamemodify = function(name)
--     -- Example of using a Lua function for fnamemodify
--     local filename = vim.fn.fnamemodify(name, ':t')
--     if string.len(filename) > 25 then
--       return string.sub(filename, 1, 10) .. '...' .. string.sub(filename, -10)
--     end
--     return filename
--   end,
--   brackets = { ' ', ' ' }, -- Using Nerd Fonts for cooler brackets
--   inactive_tab_max_length = 20, -- Limit length of inactive tabs
--   modify_indicator = ' ', -- A different indicator
-- })
