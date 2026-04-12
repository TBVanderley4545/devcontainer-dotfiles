---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.pylsp
  settings = {
    pylsp = {
      plugins = {
        pylint = {
          enabled = true
        },
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}
