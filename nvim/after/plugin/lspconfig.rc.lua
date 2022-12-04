local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- LSP mappings
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  -- keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- get the language server to recognize the 'vim'global
        globals = { 'vim' }
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }

}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
}

nvim_lsp.bashls.setup {}
nvim_lsp.dockerls.setup {}
nvim_lsp.tailwindcss.setup {}
nvim_lsp.eslint.setup {}
