    -- neo vim configuration programm
-- version A200
--
-- Aliases Definition Begin--
local fn = vim.fn
local cmd = vim.cmd
local opt = vim.opt
local o = vim.o
-- Aliasses Definition end --

-- Global Options Initialization section begin --
opt.tabstop = 4
opt.number = true
opt.encoding = 'utf-8'
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true
opt.belloff = "all"
opt.exrc = true
-- Global Options Initialization section end --
-- Setup vin-airline Rish status bar --
vim.g['airline_powerline_fonts'] = 1 
vim.g['airline#extensions#keymap#enabled'] = 0
vim.g['airline_section_z'] = "%l/%L Col:%c"
vim.g['Powerline_symbols']='unicode'
vim.g['airline#extensions#xkblayout#enabled'] = 0
vim.g.gutentags_trace = true
vim.g.gutentags_add_default_project_roots = false
vim.g.gutentags_project_root = {'package.json', '.git'}
vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/ctags/')
vim.g.gutentags_generate_on_new = true
vim.g.gutentags_generate_on_missing = true
vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_empty_buffer = true
vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
vim.g.gutentags_ctags_extra_args = {'--tag-relative=yes', '--fields=+ailmnS', }


-- Plugin imstallation section
local install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
end

-- Load the plugin manager
cmd 'packadd paq-nvim'

-- Set the short hand
local plug = require('paq-nvim').paq

-- Make paq manage it self
plug {'savq/paq-nvim', opt=true}
plug {'scrooloose/nerdtree', opt=false}
plug {'vim-airline/vim-airline', opt=false}
plug {'nvim-lua/plenary.nvim', opt=false}
plug {'nvim-telescope/telescope.nvim', opt=false}
plug {'mhinz/vim-signify', opt=false}
plug {'tpope/vim-fugitive', opt=false}
plug {'junegunn/gv.vim', opt=false}
plug {'neovim/nvim-lspconfig', opt=false}
plug {'neoclide/coc.nvim', opt=false}
plug {'ludovicchabant/vim-gutentags', opt=false}
plug {'majutsushi/tagbar', opt=false}

require('paq-nvim').install()
require('paq-nvim').clean()


-- Shortcur binding section begin --
vim.api.nvim_set_keymap( 'n',   '<F9>', ':TagbarToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n',   '<F10>', ':TagbarToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n',   '<F11>', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n',   '<F12>', ':Telescope find_files<CR>', {noremap = true})
-- Shortcur binding section end --
