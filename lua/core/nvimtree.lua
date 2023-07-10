vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup()

vim.api.nvim_set_keymap('n', '<leader>oo', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

