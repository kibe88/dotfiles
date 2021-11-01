local npairs = require("nvim-autopairs")
-- local lua_rules = require('nvim-autopairs.rules.endwise-lua')
local endwise = require('nvim-autopairs.ts-rule').endwise

local lua_rules = {
    endwise('then$', 'end', 'lua', 'if_statement'),
    endwise('function.*%(.*%)$', 'end', 'lua', 'function'),
    endwise('then$', 'end', 'ruby', 'if'),
    endwise('class(.*)$', 'end', 'ruby', 'class'),
}

local ruby_rules = {

-- then$ is a lua regex
-- end is a match pair
-- lua is a filetype
-- if_statement is a treesitter name. set it = nil to skip check with treesitter
    -- endwise('if(.*)$', 'end', 'ruby', 'if'),
    -- endwise('if(.*)$', 'end', 'ruby', 'if')
}

npairs.add_rules(lua_rules)
