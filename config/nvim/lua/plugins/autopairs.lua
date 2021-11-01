local npairs = require("nvim-autopairs")

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

npairs.setup({
    check_ts = true,
    -- ts_config = {
        -- lua = {'string'},-- it will not add pair on that treesitter node
        -- javascript = {'template_string'},
    -- }
})

require("plugins.endwise")