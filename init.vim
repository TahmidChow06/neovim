call plug#begin('~/.vim/plugged')
  Plug 'tomasiser/vim-code-dark'
  " Plug 'itchyny/lightline.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'szw/vim-maximizer'
  Plug 'jiangmiao/auto-pairs'
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-telescope/telescope.nvim' 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'crusoexia/vim-monokai'
  Plug 'preservim/nerdcommenter'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'sbdchd/neoformat'
  Plug 'sheerun/vim-polyglot'
  " Plug 'hrsh7th/nvim-cmp'
  " Plug 'hrsh7th/cmp-nvim-lsp'
  " Plug 'L3MON4D3/LuaSnip'
  " Plug 'rafamadriz/friendly-snippets'
call plug#end()

inoremap jk <ESC>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

nnoremap <TAB> :bnext<CR>

" Use alt + hjkl to resize windows
nnoremap <M-j>  :resize -2<CR>
nnoremap <M-k>  :resize +2<CR>
nnoremap <M-h>  :vertical resize +2<CR>
nnoremap <M-l>  :vertical resize -2<CR>

set mouse=a " enable mouse in neovim
set number " Set line number
set ignorecase " Search Case Insensitive
set smartcase
set splitright
" If you open something in vertical split in vim it opens it on the left tab by default here we are changing this behavior
set splitbelow
set expandtab " Convert tab to spaces
set tabstop=2
set shiftwidth=2
set nobackup
set nowritebackup
set cmdheight=1
set signcolumn=yes " https://user-images.githubusercontent.com/41671631/58532908-92312b80-8219-11e9-8d0a-da71395f4520.png
set updatetime=750 " If this many milliseconds nothing is typed the swap file will be written to disk
filetype plugin indent on
set completeopt=menuone,noinsert,noselect
let mapleader = " "

" Setting colorscheme
colorscheme onedark

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle<CR>

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Save binding
nnoremap <leader>w :Neoformat <Bar> w<CR>
nnoremap <leader>e :NvimTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'NvimTree') | q | endif

lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>sc <cmd>Telescope colorscheme<cr>

" Status bar

"let g:lightline = {
      "\ 'colorscheme': 'one',
      "\ }

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'
