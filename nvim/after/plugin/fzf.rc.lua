vim.g.fzf_layout = { window = { width = 0.9, height = 0.6, relative = 'v:true', yoffset = 1.0 } }

local keymap = vim.keymap
keymap.set('n', '<Leader>xl', ':FZF<CR>')
