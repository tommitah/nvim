vim.o.cmdheight = 0
require('vim._extui').enable({
  enable = true,
  msg = {
    target = 'cmd',
    timeout = 2000,
  },
})
