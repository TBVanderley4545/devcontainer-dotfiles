vim.pack.add({ 'https://github.com/shaunsingh/nord.nvim' })

vim.g.nord_italic = false
vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'VertSplit', { ctermbg = 'NONE', bg = 'NONE', fg = '#3B4252' })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'NONE', bg = 'NONE', fg = '#3B4252' })

require('nord').set()
