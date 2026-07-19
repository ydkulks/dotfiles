-- Toggle spell for .txt file
vim.cmd [[
augroup TxtSpell
  autocmd!
	autocmd BufRead *.txt setlocal spell spelllang=en_us
augroup END
]]

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

-- Neovim terminal: Remove line number
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

-- Disable semantic tokens for java lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil and client.name == 'jdtls' then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
})
