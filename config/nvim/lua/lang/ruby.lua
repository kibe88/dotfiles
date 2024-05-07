local config = require('lang.config')
local M = {}

function M.setup()
  config.lsp.solargraph.setup(config.default_lsp)
end

return M
