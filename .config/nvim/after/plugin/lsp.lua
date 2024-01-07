local vim = vim
local lsp = require('lsp-zero').preset({ 'recommended' })

-- -- lsp to be installed
lsp.ensure_installed({
  'tsserver',
  'html',
  'cssls',
  'jsonls',
  'emmet_ls',
  'lua_ls',
  'gopls',
  'tailwindcss',
  'htmx',
})

-- -- Mason and lspconfig related config
lsp.setup()
require("mason").setup({})
require("mason-lspconfig").setup({})

local lspconfig = require("lspconfig")
lspconfig.html.setup{}
lspconfig.emmet_ls.setup({
  -- If '!' does not trigger snippet in html, go to '~/.local/share/nvim/mason/bin/emmet-ls'
  -- file and add the character in 'triggerCharacters' variable
})
lspconfig.tailwindcss.setup{}
lspconfig.htmx.setup{}

-- -- Keymappings related to LSP
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
    vim.cmd("normal! ggVG=")
  end, opts)
  -- vim.keymap.set("", "", function() vim. end, opts)
end)
