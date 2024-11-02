local M = {}

M.setup = function()
  vim.keymap.set('n', 'gf', ':e <cfile><CR>', {})
end

M.open_picker = function()
  local menu = require 'test'
  menu:mount()
end

M.open_picker()
return
