keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })


-- Move selected line/block of text in visual mode
keymap('x', 'J', ":move '>+1<CR>gv-gv'", { noremap = true, silent = true })
keymap('x', 'K', ":move '<--2<CR>gv-gv'", { noremap = true, silent = true })

-- Transparency
keymap('n', '<Leader>ot', ':hi Normal guibg=NONE ctermbg=NONE<CR>', { noremap = true, silent = true })

-- Unhighlight
keymap('n', '<Leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

-- switch to buffer
keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- Explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telscope binding
keymap('n', '<Leader>sf', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>sc', ':Telescope colorscheme<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>sb', ':Telescope buffers<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>st', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true })

-- Lsp Saga
keymap('n', '<Leader>lr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
