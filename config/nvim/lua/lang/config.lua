local on_attach = require('lang.on_attach')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

local Config = {}

Config.capabilities = capabilities
Config.lsp = lspconfig
Config.default_lsp = {
    on_attach = Config.default_on_attach,
    capabilities = Config.capabilities
}
Config.default_on_attach = on_attach
Config.merge = function(config)
  return vim.tbl_deep_extend("force", Config.default_lsp, config)
end

return Config;
