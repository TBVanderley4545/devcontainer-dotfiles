---@type vim.lsp.Config
return {
  on_attach = function()
    local function OrganizeImports()
      local params = {
        context = {
          only = { 'source.organizeImports' }
        },
        apply = true
      }
      vim.lsp.buf.code_action(params)
    end

    vim.keymap.set('n', '<leader>fo', OrganizeImports, { noremap = true, silent = true })
  end,
  settings = {
    gopls = {
      staticcheck = true,
    },
  },
}
