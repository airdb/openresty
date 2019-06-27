-- local balancer = require('balancer')

local _M = { _VERSION = '0.1' } 
local mt = { __index = _M }

function _M.new(_)
	local self = setmetatable({
		msg = "this is smooth_wrr module.",
	}, mt)

	return self
end

function _M.set_current_peer(self, msg)
	node = {
		host = 'www.airdb.com',
		port = 80,
	}

	ngx.log(ngx.DEBUG, 'set_current_peer_success|host=', node.host, ',port=', node.port)
	-- local ok, err = ngx.balancer.set_current_peer(node.host, node.port)
	-- ngx.log(ngx.DEBUG, 'set_current_peer_success|host=', node.host, ',port=', node.port)
	return ngx.exit(ngx.HTTP_BAD_GATEWAY)
end

return _M
