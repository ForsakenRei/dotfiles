set number
set hlsearch
set clipboard+=unnamedplus
set ttyfast

syntax on
filetype plugin on
filetype plugin indent on

tnoremap <Esc> <C-\><C-n>

call plug#begin("~/.local/share/nvim/site/plugged")
 " Plugin Section
 Plug 'navarasu/onedark.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.4'}
 Plug 'nvim-telescope/telescope-file-browser.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'nvim-tree/nvim-tree.lua'
 Plug 'lewis6991/gitsigns.nvim'
 Plug 'romgrk/barbar.nvim'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'akinsho/toggleterm.nvim', {'tag': '*'}
call plug#end()

colorscheme onedark

lua <<EOF
require('telescope').setup{file_browser = {theme = 'ivy'}}
require('telescope').load_extension 'file_browser'
require('toggleterm').setup{open_mapping = [[<c-\>]]}
require('nvim-tree').setup()
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
require('barbar').setup{sidebar_filetypes = {NvimTree = true}}
EOF

let g:startify_custom_header = []
