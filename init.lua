-- neo vim configuration programm
-- version A100
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

require('paq-nvim').install()
require('paq-nvim').clean()

-- Shortcur binding section begin --
vim.api.nvim_set_keymap( 'n',   '<F11>', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n',   '<F12>', ':Telescope find_files<CR>', {noremap = true})
-- Shortcur binding section end --
