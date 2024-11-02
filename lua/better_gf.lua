local M = {}
local gf = {}

M.setup = function(config)
  vim.api.nvim_create_user_command('BetterGF', M.gf_replace, {})
  gf.config = M.setup_config(config)
end

-- TODO: figure out the annotation system and lazydev completion
--- @class better-gf.Config
--- @field use_picker boolean

--- @type better-gf.Config
M.default_config = {
  use_picker = true,
}

-- TODO: reject invalid config options
M.setup_config = function(config)
  config = config or {}
  config = vim.tbl_deep_extend('force', M.default_config, config)

  vim.validate {
    ['use_picker'] = { config.use_picker, 'boolean', true },
  }

  return config
end

M.gf_replace = function()
  local ok, err = pcall(vim.cmd.normal, 'gf')

  if not ok and gf.config.use_picker then -- if file already exists, continues like normal gf
    local missing_filename = err:match '"([^"]+)"' -- extract missing filename using regex with error message
    M.open_picker(missing_filename) -- if file doesn't exist, open picker
  elseif not ok then
    local missing_filename = err:match '"([^"]+)"' -- extract missing filename using regex with error message
    vim.cmd('e ' .. missing_filename)
  end
end

M.open_picker = function(missing_filename)
  local create_menu = require 'menu'
  create_menu(missing_filename)
end

return M
