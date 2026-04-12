local function get_jdtls_cache_dir()
  return vim.fn.stdpath('cache') .. '/jdtls'
end

local function get_jdtls_workspace_dir()
  return get_jdtls_cache_dir() .. '/workspace'
end

local function get_git_branch()
  -- Run the git command and throw out any stderr
  local handle = io.popen('git branch --show-current 2>/dev/null')

  if not handle then
    return nil
  end

  local result = handle:read('*a')
  handle:close()

  -- Clean up whitespace/newlines
  local branch = result:gsub('%s+', '')

  -- Return nil if not in a git repo (empty result)
  return (branch ~= '' and branch) or nil
end

local workspace_dir = get_jdtls_workspace_dir()

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local git_branch = get_git_branch()

local data_dir = workspace_dir

data_dir = data_dir .. '/' .. project_name

if git_branch then
  data_dir = data_dir .. '/' .. git_branch
end

local lombok_jar_location = vim.fn.expand('~/.local/share/nvim/mason/share/jdtls/lombok.jar')

---@type vim.lsp.Config
return {
  cmd = {
    'jdtls',
    '-data',
    data_dir,
    string.format('--jvm-arg=-javaagent:%s', lombok_jar_location),
    '--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false',
    '-Xmx4G'
  },
  ---@type lspconfig.settings.jdtls
  settings = {
    java = {
      format = {
        enabled = true,
        comments = { enabled = false },
        tabSize = 4,
      }
    }
  },
}
