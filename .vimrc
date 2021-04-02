" *************************
" VIM Initialization script. Version 0.0.1
" **************************
" **************************
" Common option setup
" **************************
set number
set nocompatible
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number
"**************************
" Cursor option
" *************************
" Insert mode
let &t_SI = "\e[4 q"
" Normal mode
let &t_EI = "\e[2 q"
" *************************
" File Type Configuration
" *************************
filetype plugin indent on
" *************************
" Shortcut setup
" *************************
nmap <F8> :TagbarToggle<CR
" ****************************************
" Plugin and Plugin Manager Configuration
" ****************************************
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ****************************************
" begin lugins  definition
" ****************************************
call plug#begin('~/.vim/bundle')
" Status Line Plugin
Plug 'vim-airline/vim-airline'
" GIT management plugin
Plug 'tpope/vim-fugitive'
" Current version requires additional setup and does not work from box
" YCM server shutdown often. Configuration requirer python 3.8 headers
"Plug 'Valloric/YouCompleteMe'
" Syntax checker for C++ plugin
Plug 'vim-syntastic/syntastic'
" TAG handler plugin
Plug 'preservim/tagbar'
call plug#end() 
" end of plugins definition
" Setup vin-airline Rish status bar
let g:airline_powerline_fonts = 1 
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
