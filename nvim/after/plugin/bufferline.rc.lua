local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup({
  options = {
    mode = 'tabs',
    separator_style = { "|", "|" },
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    show_duplicate_prefix = false,
  },
  highlights = {
    fill = {
      bg = '#fdf6e3',
    },
    separator_selected = {
      fg = '#fdf6e3',
    },
    separator_visible = {
      fg = '#fdf6e3',
    },
    separator = {
      fg = '#fdf6e3',
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
