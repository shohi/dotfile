-- setup of tool plugins
local api = vim.api
local g = vim.g

-- hop.nvim -  Neovim motions on speed!
-- https://github.com/phaazon/hop.nvim
api.nvim_set_keymap('n',
  's',
  "<cmd>lua require('hop').hint_words()<cr>",
  {})


-- nvim-colorizer.lua - The fastest Neovim colorizer
-- https://github.com/norcalli/nvim-colorizer.lua
require('colorizer').setup()


-- auto-session - A small automated session manager for Neovim
-- https://github.com/rmagatti/auto-session
-- g.auto_session_pre_save_cmds = {"tabdo NERDTreeClose"}

require('auto-session').setup {
  pre_save_cmds = {"tabdo NERDTreeClose"}
}
