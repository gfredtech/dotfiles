local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

nvim_tree.setup {}

vim.keymap.set('n', '<Tab><Tab>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
