local M = {}

M.setup = function()
  vim.api.nvim_create_user_command("BetterGF", M.gf_replace, {})
end

-- TODO: make using picker optional
M.gf_replace = function()
  if pcall(vim.cmd.normal, 'gf') then -- if file already exists, continues like normal gf
  else
    M.open_picker() -- if file doesn't exist, open picker
  end
end

-- TODO: use word under cursor when pressing keybind and pass it to menu
M.open_picker = function()
  local menu = require 'test'
  menu:mount()
end

-- M.open_picker()

return M
