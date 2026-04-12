vim.pack.add({
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/mfussenegger/nvim-dap-python'
})

require('dapui').setup()

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })

-- To get this working correctly, you will need to pip install the following in your venv
-- debugpy
require('dap-python').setup('~/.python_envs/default/bin/python')

local dap, dapui = require('dap'), require('dapui')

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
