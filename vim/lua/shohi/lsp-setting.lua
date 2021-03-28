-- https://github.com/kabouzeid/nvim-lspinstall
local cmd = vim.cmd
local li = require('lspinstall')
local lc = require('lspconfig')

local function setup_servers()
  li.setup()
  local servers = li.installed_servers()
  for _, server in pairs(servers) do
    lc[server].setup{}
  end
end

setup_servers()


-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
li.post_install_hook = function ()
  setup_servers() -- reload installed servers
  cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
