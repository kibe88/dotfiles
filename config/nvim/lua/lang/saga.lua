local saga = require 'lspsaga'
local keymap = vim.keymap.set

local saga_config = {
  symbol_in_winbar = {
    -- disable winbar
    enable = false,
    separator = " ",
    ignore_patterns={},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
}

saga.setup(saga_config)

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
