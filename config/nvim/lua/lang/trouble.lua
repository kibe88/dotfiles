require("trouble").setup {use_diagnostic_signs = true}

local keymap_opts = {silent = true, noremap = true}
-- Lua
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>Trouble<cr>", keymap_opts)
vim.api.nvim_set_keymap("n", "<leader>tw",
                        "<cmd>Trouble lsp_workspace_diagnostics<cr>",
                        keymap_opts)
vim.api.nvim_set_keymap("n", "<leader>td",
                        "<cmd>Trouble lsp_document_diagnostics<cr>", keymap_opts)
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>",
                        keymap_opts)
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",
                        keymap_opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
                        keymap_opts)
