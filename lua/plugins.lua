--  Plugins configuration --

vim.cmd [[packadd packer.nvim]]

return require ('packer').startup(function() 
    use 'wbthomason/packer.nvim'
    use 'beauwilliams/statusline.lua'
    use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end, }
    use { 'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'majutsushi/tagbar'
    use 'ludovicchabant/vim-gutentags'
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'mfussenegger/nvim-jdtls'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)
