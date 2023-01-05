local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
  use 'ellisonleao/gruvbox.nvim'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', }, tag = 'nightly'}
  use 'kchmck/vim-coffee-script'
  use 'tpope/vim-surround'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'vim-test/vim-test'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'jose-elias-alvarez/null-ls.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'ray-x/lsp_signature.nvim',
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'skywind3000/asyncrun.vim'
  use 'jparise/vim-graphql'
  use 'dhruvasagar/vim-table-mode'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
