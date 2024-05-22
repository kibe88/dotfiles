local config = require('lang.config')
local M = {
  config = {
    diagnostics = false, -- Use rubocop LSP directly
    autoformat = false,
formatting = false,
    useBundler = true,
  }
}

function M.setup()
  config.lsp.solargraph.setup(config.merge(M.config))
end

return M
