-- local M = {}
Menu = require 'nui.menu'
-- event = require('nui.utils.autocmd').event

local menu = Menu({
  position = '50%',
  relative = 'editor',
  size = {
    width = 25,
    height = 5,
  },
  border = {
    style = 'rounded',
    text = {
      top = '[Create New File?]',
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
  max_width = 20,
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
    print('Menu Submitted: ', item.text)
  end,
})

-- mount the component
-- menu:mount()
return menu
