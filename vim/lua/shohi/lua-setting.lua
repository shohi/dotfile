local li = require('lspinstall')
li.setup() -- important

local servers = li.installed_servers()
for _, server in pairs(servers) do
  li[server].setup{}
end
