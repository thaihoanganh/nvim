local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- nvim-tree
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ':BufferMoveNext<CR>', opts)