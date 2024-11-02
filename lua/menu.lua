Menu = require 'nui.menu'
-- event = require('nui.utils.autocmd').event

local create_menu = function(missing_filename)
  local menu = Menu({
    position = '50%',
    relative = 'editor',
    size = {
      width = 50,
      height = 5,
    },
    border = {
      style = 'rounded',
      text = {
        top = '[Create New File: \'' .. missing_filename .. '\' ]',
        top_align = 'center',
      },
    },
    win_options = {
      -- winhighlight = 'Normal:Normal,FloatBorder:Normal',
      winhighlight = 'Normal:Normal',
    },
  }, {
    lines = {
      Menu.item 'Yes',
      Menu.item 'No',
    },
    max_width = 200,
    keymap = {
      focus_next = { 'j', '<Down>', '<Tab>', '<C-n>' },
      focus_prev = { 'k', '<Up>', '<S-Tab>', '<C-p>' },
      close = { '<Esc>', '<C-c>', 'q' },
      submit = { '<CR>', '<Space>' },
    },
    on_close = function()
      print 'Menu Closed!'
    end,
    on_submit = function(item)
      -- print('Menu Submitted: ', item.text)
      if item.text == 'Yes' then
        vim.cmd('e ' .. missing_filename)
      end
    end,
  })

  menu:mount()
end

-- mount the component
-- menu:mount()
return create_menu
