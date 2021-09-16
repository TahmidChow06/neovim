call plug#begin('~/.config/nvim/plugged')
  Plug 'tomasiser/vim-code-dark'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'easymotion/vim-easymotion'
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
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'karb94/neoscroll.nvim'
  Plug 'wfxr/minimap.vim'
  Plug 'Pocco81/AutoSave.nvim'
  "Plug 'sheerun/vim-polyglot'
  Plug 'metakirby5/codi.vim'
  Plug 'tpope/vim-surround'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'lervag/vimtex'
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
set relativenumber " Set realtive line number
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

" Source neovim 
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>

lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" running code
nnoremap <leader>r :w <bar> !python %<CR>
autocmd FileType tex nnoremap <leader>r :!pdflatex %<CR>

" Toggle Codi
nnoremap <leader>p :Codi
" Find files using Telescope command-line sugar.
nnoremap <leader>sf <cmd>Telescope find_files<cr>
nnoremap <leader>sg <cmd>Telescope live_grep<cr>
nnoremap <leader>sb <cmd>Telescope buffers<cr>
nnoremap <leader>sc <cmd>Telescope colorscheme<cr>

let g:minimap_auto_start=1
hi MinimapCurrentLine ctermfg=Green guifg=#00d700 guibg=#323232
let g:minimap_highlight = 'MinimapCurrentLine'

" for nvim colorizer
set termguicolors

lua << EOF
require 'colorizer'.setup()
require('neoscroll').setup()

require('lualine').setup {
	options = {theme = 'codedark'}
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF
