-- Keymapping configuration --

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
--******************************************
-- nvim-tree key mapping  ---
-- *****************************************
map('n', '<F12>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
-- *****************************************
-- telescop mapping ---
-- *****************************************
map('n', '<F11>', ':Telescop find_files<CR>', default_opts)
map('n', '<F10>', ':Telescop buffers<CR>', default_opts)
-- ****************************************
-- Tagbar mapping
-- ****************************************
map( 'n',   '<F9>', ':TagbarToggle<CR>', {noremap = true})
map( 'n',   '<F8>', ':TagbarOpenAutoClose<CR>', {noremap = true})
map( 'n',   '<C-F><C-J>', ':Neoformat astyle<CR>', {noremap = true})
map( 'n',   '<C-F><C-P>', ':Neoformat autopep8<CR>', {noremap = true})
-- Buffer Switching ---
map( 'n',   '<C-P>', ':bn<CR>', {noremap = true})
map( 'n',   '<C-B>', ':bp<CR>', {noremap = true})
