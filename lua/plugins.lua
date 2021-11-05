--  Plugins configuration --
--  Version A100 --

vim.cmd [[packadd packer.nvim]]

return require ('packer').startup(function() 
	use 'wbthomason/packer.nvim'
	use  { 'nvim-lualine/lualine.nvim',
	requires = {'kyazdani42/nvim-web-devicons', opt=true},
	config = function() require('lualine').setup() end,}
    use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end, }
    use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {} end, }
    use 'majutsushi/tagbar'
    use 'ludovicchabant/vim-gutentags'
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use 'neovim/nvim-lspconfig'
--    use 'kabouzeid/nvim-lspinstall'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
end)
