vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', verion = vim.version.range('*') }
})

require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal'
  }
})
