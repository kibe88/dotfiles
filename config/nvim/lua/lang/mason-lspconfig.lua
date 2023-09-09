local M = {}

function M.setup()
  local options = {
        ensure_installed = {
            'lua_ls', 'omnisharp', 'phpactor', 'tsserver', 'jdtls', 'dockerls', 'efm', 'solargraph', 'jedi_language_server'
        }
    }
  require("mason-lspconfig").setup(options)
end

return M
