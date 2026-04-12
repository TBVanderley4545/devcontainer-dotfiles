vim.pack.add({
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim'
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'ansible-lint',
    'black',
    'debugpy',
    'isort',
    'pylint',
    'staticcheck',
    'tree-sitter-cli',
  }
})
