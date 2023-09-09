local config = require('lang.config')

local lua_lsp_config ={
    -- available in path (installed through arch package manager)
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        config.default_on_attach(client, bufnr)
    end,
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim", "use"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/lang")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}

config.lsp.lua_ls.setup(config.merge(lua_lsp_config))
