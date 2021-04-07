" *************************
" VIM Initialization script. Version 0.2
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
" *************************
" File Type Configuration
" *************************
filetype plugin indent on
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
" File Tree
Plug 'scrooloose/nerdtree'
" Python Mode
Plug 'klen/python-mode'
" Tags handler
Plug 'ludovicchabant/vim-gutentags'
" RobotFramework
Plug 'mfukar/robotframework-vim'
" FZF Framework
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end() 
" end of plugins definition
" ***********************************
" Setup GutenTag
" ***********************************
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = ['.git']
let g:gutentags_generate_on_write=1
let g:gutentags_generate_on_missing=1
let g:gutentags_generate_on_new=1
let g:gutentags_file_list_command = 'find . -type f'
" ***********************************
" Setup vin-airline Rish status bar
" ***********************************
let g:airline_powerline_fonts = 1 
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
" *************************
" Shortcut setup
" *************************
nmap <F8> :TagbarOpen fjc<CR>
nmap <F2> :NERDTreeToggle<CR>
"nmap <F6> :CtrlP<CR>
nnoremap <F12> "=strftime("%d/%m/%y %H:%M")<CR>P
inoremap <F12> <C-R>=strftime("%d/%m/%y %H:%M")<CR>
