local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = 'serenata'
local bin_name = 'serenata'

configs[server_name] = {
  default_config = {
    cmd = { bin_name, '--uri=tcp://127.0.0.1:11111' },
    filetypes = { 'php' },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('composer.json', '.git')(pattern)

      -- prefer cwd if root is a descendant
      return util.path.is_descendant(cwd, root) and cwd or root
    end,
  },
  docs = {
    description = [[
https://gitlab.com/Serenata/Serenata
Installation: https://gitlab.com/Serenata/Serenata/-/blob/master/README.md
]],
    default_config = {
      cmd = { 'serenata', '--uri=tcp://127.0.0.1:11111' },
      root_dir = [[root_pattern("composer.json", ".git")]],
    },
  },
}
