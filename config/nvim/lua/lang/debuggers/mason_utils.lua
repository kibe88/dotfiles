local M = {}

M.get_package_install_path = function(name)
    local mason_registry = require("mason-registry")
    local package = mason_registry.get_package(name) -- note that this will error if you provide a non-existent package name
    package:get_install_path() -- returns a string like "/home/user/.local/share/nvim/mason/packages/codelldb"
end

return M
