return {
  -- {
  --   "airblade/vim-gitgutter",
  --   event = "VeryLazy",
  --   opts = {},
  --   config = function()
  --     vim.keymap.set("n", "<up>", ":GitGutterPrevHunk<CR>", { desc = 'Previous Hunk' })
  --     vim.keymap.set("n", "<down>", ":GitGutterNextHunk<CR>", { desc = 'Next Hunk' })
  --     vim.cmd("let g:gitgutter_sign_added = '┃'")
  --     vim.cmd("let g:gitgutter_sign_modified = '┃'")
  --     vim.cmd("let g:gitgutter_sign_removed = '┃'")
  --   end
  -- },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("gitsigns").setup {
        require('gitsigns').setup {
          on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            -- map('n', '<up>', gitsigns.nav_hunk('prev'), { desc = 'Git Prev Hunk' })
            -- map('n', '<down>', gitsigns.nav_hunk('next'), { desc = 'Git Next Hunk' })
            map('n', '<down>', function()
              if vim.wo.diff then
                vim.cmd.normal({ '<down>', bang = true })
              else
                gitsigns.nav_hunk('next')
              end
            end, { desc = 'Git Next Hunk' })

            map('n', '<up>', function()
              if vim.wo.diff then
                vim.cmd.normal({ '<up>', bang = true })
              else
                gitsigns.nav_hunk('prev')
              end
            end, { desc = 'Git Prev Hunk' })

            -- Actions
            map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git Stage Hunk' })
            map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git Reset Hunk' })
            map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
              { desc = 'Git Stage Hunk' })
            map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
              { desc = 'Git Reset Hunk' })
            map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git Stage Buffer' })
            -- map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Git Undo Stage Hunk' })
            map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git  Reset Buffer' })
            map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git Preview Hunk' })
            map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'Git Blame Line' })
            map('n', '<leader>htb', gitsigns.toggle_current_line_blame, { desc = 'Git toggle Blame' })
            map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git Diff' })
            map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = 'Git Diff' })
            -- map('n', '<leader>htd', gitsigns.toggle_deleted, { desc = 'Git Toggle Deleted' })

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end
        }
      }
    end
  }
}
