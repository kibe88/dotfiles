local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    indent = {enable = true},
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
    },
}


vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
