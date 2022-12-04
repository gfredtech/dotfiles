local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use {
  --  'svrana/neosolarized.nvim',
  --  requires = { 'tjdevries/colorbuddy.nvim' }
  -- }
  use 'nvim-lualine/lualine.nvim' -- status line
  use 'nvim-lua/plenary.nvim' -- common utilities for telescope
  use 'onsails/lspkind-nvim' -- vscode-like pictograms for completion
  use 'hrsh7th/cmp-buffer' --nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' --nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via lua
  -- use 'williamboman/mason.nvim'
  -- use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip' -- lua snippets
  use {
    'nvim-treesitter/nvim-treesitter', -- tree sitter
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'kyazdani42/nvim-web-devicons' -- file icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/nvim-bufferline.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame and browse

  use 'MunifTanjim/prettier.nvim'
  use 'mattn/emmet-vim'
  use 'cpea2506/one_monokai.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'preservim/nerdcommenter'
  use 'RRethy/vim-illuminate'

  use 'folke/which-key.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  --use {
  --'kdheepak/monochrome.nvim', config = function()
  --vim.cmd 'colorscheme monochrome'
  --end
  --}
end)
