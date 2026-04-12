vim.g.loaded = 1

vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_option_value('mouse', '', {})

vim.api.nvim_set_option_value('encoding', 'utf-8', {})

vim.api.nvim_set_option_value('termguicolors', true, {})

vim.api.nvim_set_option_value('backspace', 'indent,eol,start', {})

vim.api.nvim_set_option_value('updatetime', 250, {})

vim.api.nvim_set_option_value('scrolloff', 8, {})

vim.api.nvim_set_option_value('hlsearch', false, {})

vim.api.nvim_set_option_value('ignorecase', true, {})

vim.api.nvim_set_option_value('smartcase', true, {})

vim.api.nvim_set_option_value('wrap', false, {})

vim.api.nvim_set_option_value('swapfile', false, {})

vim.api.nvim_set_option_value('number', true, {})

vim.api.nvim_set_option_value('relativenumber', true, {})

vim.api.nvim_set_option_value('expandtab', true, {})

vim.api.nvim_set_option_value('tabstop', 2, {})

vim.api.nvim_set_option_value('shiftwidth', 2, {})

vim.api.nvim_set_option_value('splitright', true, {})

vim.api.nvim_set_option_value('splitbelow', true, {})

vim.api.nvim_set_option_value('laststatus', 3, {})

vim.opt.winborder = 'double'

vim.opt.pumborder = 'double'

vim.g.mapleader = " "

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank({ higroup = "incsearch", timeout = 750 })
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',
  callback = function()
    vim.api.nvim_set_option_value('filetype', 'jsonc', { buf = 0 })
  end
})

vim.filetype.add({
  pattern = {
    ['.*/*.ansible.yml'] = 'yaml.ansible',
  }
})
