---@type vim.lsp.Config
return {
  --- @type lspconfig.settings.vtsls
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = '~/.nvm/versions/node/v22.18.0/lib/node_modules/@vue/language-server',
            languages = { 'vue' },
            configNamespace = 'typescript',
          },
        },
      },
    },
  },
  filetypes = { 'vue' },
}
