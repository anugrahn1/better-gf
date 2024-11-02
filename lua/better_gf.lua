local M = {}

M.setup = function()
  vim.api.nvim_create_user_command('BetterGF', M.gf_replace, {})
end

-- TODO: make using picker optional
M.gf_replace = function()
  local ok, err = pcall(vim.cmd.normal, 'gf')

  if ok then -- if file already exists, continues like normal gf
  else
    local missing_filename = err:match '"([^"]+)"' -- extract missing filename using regex with error message
    M.open_picker(missing_filename) -- if file doesn't exist, open picker
  end
end

M.open_picker = function(missing_filename)
  local create_menu = require 'test'
  create_menu(missing_filename)
end


return M
