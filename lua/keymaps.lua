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
vim.api.nvim_set_keymap( 'n',   '<F9>', ':TagbarToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n',   '<F8>', ':TagbarOpenAutoClose<CR>', {noremap = true})

