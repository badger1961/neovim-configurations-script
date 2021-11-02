-- neo vim configuration programm
-- version A000
--
-- Aliases Definition Begin--
local fn = vim.fn
local cmd = vim.cmd
-- Aliasses Definition end --

-- Global Options Initialization section begin --
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.encoding = 'utf-8'
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.belloff = "all"
vim.opt.exrc = true
-- Global Options Initialization section end --


local homePath = os.getenv("HOMEPATH")
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
plug {'scrooloose/nerdtree', opt=true}

require('paq-nvim').install()
require('paq-nvim').clean()