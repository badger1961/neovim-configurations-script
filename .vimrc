" Common option setup
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number
" Install and setup Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" begin lugins  definition
call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end() 
" end of plugins definition
" Setup vin-airline Rish status bar
let g:airline_powerline_fonts = 1 
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
