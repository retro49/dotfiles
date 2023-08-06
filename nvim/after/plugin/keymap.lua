vim.g.mapleader = ' '
local nvim_tree_api = require("nvim-tree.api")
-- nvim-tree toggle
vim.keymap.set('n', '<leader>ft', nvim_tree_api.tree.toggle, {})
