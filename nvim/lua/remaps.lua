-- General Remaps
vim.keymap.set('n', '<leader>s', '<c-w>x')
vim.keymap.set('n', '<leader>=', '<c-w>=')
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')
vim.keymap.set('n', '<leader><Left>', ':vertical resize -5<CR>')
vim.keymap.set('n', '<leader><Right>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<leader><Down>', ':resize -5<CR>')
vim.keymap.set('n', '<leader><Up>', ':resize +5<CR>')
vim.keymap.set('n', '<leader>fs', ':w<CR>')
vim.keymap.set('n', '<leader>fc', ':q<CR>')
vim.keymap.set('n', '<leader>;', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>tn', ':set norelativenumber<CR>')
vim.keymap.set('n', '<leader>tr', ':set relativenumber<CR>')
vim.keymap.set('n', '<leader>w', ':Telescope git_files<CR>')
vim.keymap.set('n', '<leader>q', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>gf', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>co', ':%bd|e#|bd#<CR>')
vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })

-- Gitsigns Remaps
vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')

-- LazyGit Remaps
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')

-- Debugger Remaps
vim.keymap.set('n', '<F5>', ':DapContinue<CR>')
vim.keymap.set('n', '<F10>', ':DapStepOver<CR>')
vim.keymap.set('n', '<F11>', ':DapStepInto<CR>')
vim.keymap.set('n', '<F12>', ':DapStepOut<CR>')
vim.keymap.set('n', '<leader>tb', ':DapToggleBreakpoint<CR>')

-- LSP Remaps
local opts = { noremap = true, silent = true }

local function go_to_next_diagnostic()
  vim.diagnostic.jump({ count = 1, float = true })
end

local function go_to_previous_diagnostic()
  vim.diagnostic.jump({ count = -1, float = true })
end

vim.keymap.set('n', '<leader>np', go_to_next_diagnostic, opts)
vim.keymap.set('n', '<leader>pp', go_to_previous_diagnostic, opts)
vim.keymap.set('n', '<leader>sp', ':Telescope diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format { async = true } end, opts)
vim.keymap.set('i', '<c-h>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>ph', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', opts)
vim.keymap.set('n', 'gy', ':Telescope lsp_type_definitions<CR>', opts)
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', opts)
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', opts)
