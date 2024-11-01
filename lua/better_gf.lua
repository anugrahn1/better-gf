local M = {}

M.setup = function ()
  vim.keymap.set('n','gf', ':e <cfile><CR>',{} )
end

M.open_picker = function(opts, cb)
  local popup = require 'plenary.popup'
  local Win_id

  local width = 30
  local height = 3
  local borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

  Win_id = popup.create(opts, {
    title = 'Create New File?',
    highlight = 'MyProjectWindow',
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
    callback = cb,
  })
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<cmd>lua CloseMenu()<CR>', { silent = false })

  CloseMenu = function()
    vim.api.nvim_win_close(Win_id, true)
  end
end

-- takes user input into `sel` variable
local cb = function(_, sel)
  print(sel)
end

-- TODO: https://dev.to/____marcell/how-to-create-an-ui-menu-in-neovim-2k6a
M.open_picker({
  'Yes',
  'No',
}, cb)

return M
