local saga = require 'lspsaga'

-- add your config value here
-- default value
local saga_config = {
    diagnostic_header = { '', '','', ''},
    code_action_icon = ' ',
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        sign_priority = 10,
        virtual_text = true,
        update_time = 150,
    },
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {quit = 'q', exec = '<CR>'},
    -- "single" "double" "round" "plus"
    border_style = "single",
}

saga.init_lsp_saga(saga_config)
