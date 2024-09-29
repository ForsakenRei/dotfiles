set number
set hlsearch
set clipboard+=unnamedplus
set ttyfast
set splitright
set splitbelow
set cursorline
set list
set lcs=tab:'»,trail:·,lead:·,nbsp:␣
set timeoutlen=300

syntax on
filetype plugin on
filetype plugin indent on

tnoremap <Esc> <C-\><C-n>

call plug#begin("~/.local/share/nvim/site/plugged")
 " Plugin Section
 Plug 'navarasu/onedark.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}
 Plug 'nvim-telescope/telescope-file-browser.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-tree/nvim-web-devicons'
 Plug 'nvim-tree/nvim-tree.lua'
 Plug 'lewis6991/gitsigns.nvim'
 Plug 'romgrk/barbar.nvim'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'akinsho/toggleterm.nvim', {'tag': '*'}
 Plug 'lukas-reineke/indent-blankline.nvim'
 Plug 'AckslD/nvim-neoclip.lua'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'hrsh7th/vim-vsnip'
 Plug 'neovim/nvim-lspconfig'
 Plug 'echasnovski/mini.pairs', { 'branch': 'stable' }
call plug#end()

colorscheme onedark

lua <<EOF
require('telescope').setup{file_browser = {theme = 'ivy'}}
require('telescope').load_extension 'file_browser'
require('toggleterm').setup{open_mapping = [[<c-\>]]}
require('nvim-tree').setup()
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
require('barbar').setup{sidebar_filetypes = {NvimTree = true}}
require('ibl').setup()
require('neoclip').setup()
require('mini.pairs').setup()
EOF

lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    preselect = cmp.PreselectMode.None,
    completion = {
      completeopt = "menu,menuone,noselect"
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, 
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
--[[
  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
--]]
EOF

let g:startify_custom_header = []
let g:vsnip_filetypes = {}

lua <<EOF
  local osc52 = require('vim.ui.clipboard.osc52')
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = osc52.copy('+'),
      ['*'] = osc52.copy('*'),
    },
    paste = {
      ['+'] = osc52.paste('+'),
      ['*'] = osc52.paste('*'),
    },
  }
EOF
