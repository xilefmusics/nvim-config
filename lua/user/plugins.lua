vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, _ = pcall(require, "packer")
if not status_ok then
  vim.api.nvim_echo({ { "packer failed to load", "None" } }, false, {})
  return
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', } } }
  use 'folke/which-key.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'morhetz/gruvbox'
  use 'nvim-lualine/lualine.nvim'
  -- cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use "hrsh7th/cmp-nvim-lsp"
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  --use 'tamago324/nlsp-settings.nvim'
  --use 'jose-elias-alvarez/null-ls.nvim'
  
  -- helper
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use 'tpope/vim-surround'

end)
