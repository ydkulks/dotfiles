-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'drewtempelmeyer/palenight.vim'
	-- use 'ellisonleao/gruvbox.nvim'
	-- Post-install/update hook with neovim command
	-- use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate' })
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		branch = 'master',
		tag = 'v0.8.5.2'
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'neoclide/coc.nvim',
		branch = 'release',
		run = ':CocInstall coc-pairs coc-html coc-css coc-tsserver coc-json coc-emmet coc-prettier @yaegassy/coc-tailwindcss3 coc-markdownlint coc-go'
	}
	use {'tpope/vim-fugitive'}
	use 'christoomey/vim-tmux-navigator'
	use 'airblade/vim-gitgutter'
	use 'dsznajder/vscode-es7-javascript-react-snippets'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-tree/nvim-tree.lua'
	use 'Yggdroot/indentLine'
	use 'tpope/vim-commentary'
	use 'mbbill/undotree'
	use 'ThePrimeagen/harpoon'
	use 'ThePrimeagen/vim-be-good'
	use {
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		config = function ()
			require"octo".setup()
		end
	}
	use '/home/yd/Projects/speedster.nvim'
	--use 'mfussenegger/nvim-dap'
	--use 'rcarriga/nvim-dap-ui'
	--	use {
		--		'VonHeikemen/lsp-zero.nvim',
		--		branch = 'v2.x',
		--		requires = {
			--			-- LSP Support
			--			{'neovim/nvim-lspconfig'},             -- Required
			--			{'williamboman/mason.nvim'},           -- Optional
			--			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			--
			--			-- Autocompletion
			--			{'hrsh7th/nvim-cmp'},     -- Required
			--			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			--			{'L3MON4D3/LuaSnip'},     -- Required
			--		}
			--	}
end,
})
