vim.pack.add({
  'https://github.com/mfussenegger/nvim-jdtls',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason-lspconfig.nvim'
})

require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'ansiblels',
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'emmet_ls',
    'eslint',
    'gopls',
    'html',
    'jdtls',
    'jsonls',
    'lua_ls',
    'pylsp',
    'remark_ls',
    'sqls',
    'stylelint_lsp',
    'svelte',
    'ts_ls',
    'vtsls',
    'vue_ls',
    'yamlls'
  }
})

vim.lsp.enable('cssls')
vim.lsp.enable('dockerls')
vim.lsp.enable('eslint')
vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('jdtls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('remark_ls')
vim.lsp.enable('stylelint_lsp')
vim.lsp.enable('ts_ls')
vim.lsp.enable('vtsls')
vim.lsp.enable('yamlls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'fuzzy', 'menu', 'menuone', 'noselect', 'popup' }
      vim.keymap.set('i', '<c-space>', vim.lsp.completion.get)
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
