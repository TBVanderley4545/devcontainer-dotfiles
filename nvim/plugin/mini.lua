vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.pairs',    verion = vim.version.range('*') },
  { src = 'https://github.com/nvim-mini/mini.surround', verion = vim.version.range('*') }
})

require('mini.pairs').setup()
require('mini.surround').setup()
