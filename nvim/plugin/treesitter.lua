vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').install({
  'css',
  'go',
  'html',
  'java',
  'javascript',
  'json',
  'lua',
  'markdown',
  'python',
  'scss',
  'sql',
  'tsx',
  'typescript',
  'yaml',
  'svelte',
  'vue'
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    if vim.treesitter.get_parser(nil, nil) then
      vim.treesitter.start()
    end
  end,
})
