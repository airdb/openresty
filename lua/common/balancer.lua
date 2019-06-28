local balancer = require('ngx.balancer')
	node = {
		host = '127.0.0.1',
		port = 8111,
	}

	ngx.log(ngx.INFO, 'set_current_peer_success|host=', node.host, ',port=', node.port)
	local ok, err = balancer.set_current_peer(node.host, node.port)
    if not ok then
        ngx.log(ngx.ERR, "failed to set the current peer: ", err)
        return ngx.exit(500)
    end
