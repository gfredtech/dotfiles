local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'html',
    'help',
    'javascript',
    'typescript',
    'tsx',
    'lua',
    'json',
    'css',
    'vim',
  },
  autotag = {
    enable = true,
  },
}
