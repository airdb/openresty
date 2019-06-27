local balancer = require('ngx.balancer')

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
		host = '127.0.0.1',
		port = 8111,
	}

	ngx.log(ngx.INFO, 'set_current_peer_success|host=', node.host, ',port=', node.port)
	-- local ok, err = balancer.set_current_peer(node.host, node.port)
	local ok, err = balancer.set_current_peer("127.0.0.1", 8111)
    if not ok then
        ngx.log(ngx.ERR, "failed to set the current peer: ", err)
        return ngx.exit(500)
    else
	    ngx.log(ngx.INFO, "xxxx")
    end
	-- ngx.log(ngx.DEBUG, 'set_current_peer_success|host=', node.host, ',port=', node.port)
	-- return ngx.exit(ngx.HTTP_BAD_GATEWAY)
end

return _M
