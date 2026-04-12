---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.stylelint_lsp
  settings = {
    stylelintplus = {
      -- see available options in stylelint-lsp documentation
    }
  },
  filetypes = { 'css', 'less', 'scss' }
}
