local li = require('lspinstall')
local lc = require('lspconfig')
li.setup() -- important

local servers = li.installed_servers()
for _, server in pairs(servers) do
  lc[server].setup{}
end
