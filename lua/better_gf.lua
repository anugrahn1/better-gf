local M = {}

M.setup = function ()
  vim.keymap.set('n','gf', ':e <cfile><CR>',{} )
end



return M
