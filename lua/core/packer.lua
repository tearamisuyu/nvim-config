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


  -- Theme
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'nyoom-engineering/oxocarbon.nvim' }
  use 'Mofiqul/dracula.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  vim.opt.background = 'dark'
  vim.cmd.colorscheme 'oxocarbon'


  -- Code
  use 'nvim-tree/nvim-tree.lua'
  use 'rstacruz/vim-closer'
  use 'tpope/vim-fugitive'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSEnable highlight' }
  use {
    'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end },
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)

