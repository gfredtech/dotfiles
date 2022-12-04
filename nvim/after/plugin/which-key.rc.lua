local status, which_key = pcall(require, 'which-key')
if (not status) then
  print('which_key not found')
  return
end

-- my leader key is re-mapped to <C-w>w,
-- so I'm disabling which-key for now because it won't work otherwise
-- until I find a better alternative for the above mapping
--which_key.setup {}
