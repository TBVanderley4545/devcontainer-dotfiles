---@type vim.lsp.Config
return {
  on_attach = function(client)
    local function OrganizeImports()
      local params = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) },
      }
      client:exec_cmd(params)
    end

    vim.keymap.set('n', '<leader>fo', OrganizeImports, { noremap = true, silent = true })

    client.server_capabilities.documentFormattingProvider = false
  end,
}
