local status, one_monokai = pcall(require, 'one_monokai')
if (not status) then return end

one_monokai.setup {}
