ngx.header.Server = 'AGW'

local uustr = require("lua.common.uustr")
ngx.header['x-airdb-request-id'] = uustr.randomStr(64)
-- X-Served-By:
