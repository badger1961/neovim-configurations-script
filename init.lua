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
plug {'nvim-lua/completion-nvim', opt=false}
-- Setup LSP --
local nvim_lsp = require('lspconfig')

require('paq-nvim').install()
require('paq-nvim').clean()

vim.g['completeopt']="preview"

local on_attach = function(client, bufnr)
    require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
  end

  local servers = {'pylsp'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

-- Shortcur binding section begin --
vim.api.nvim_set_keymap( 'n',   '<F11>', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap( 'n',   '<F12>', ':Telescope find_files<CR>', {noremap = true})
-- Shortcur binding section end --
