local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    indent = {enable = true},
}


vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
