local _M = { _VERSION = '0.1' } 
local mt = { __index = _M }

function _M.new(self)
	ngx.say("this is hello module")
end

return _M
