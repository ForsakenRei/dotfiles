set number
set hlsearch
set clipboard+=unnamedplus
set ttyfast

syntax on
filetype plugin on
filetype plugin indent on

call plug#begin("~/.local/share/nvim/site/plugged")
" Plugin Section
 Plug 'navarasu/onedark.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme onedark