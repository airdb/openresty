local _M = { _VERSION = '0.1' } 
local mt = { __index = _M }

-- struct Node {
--   string Name;
--   int    Current;
--   int    Weight;
-- }

function _M.new(_)
	local node = {}
	local self = setmetatable({
		msg = "this is smooth_wrr module.",
		-- node.Name = "a",
		-- node.Current = 0,
		-- node.Weight = 0,
	}, mt)

	return self
end

function _M.smooth_wrr(self) 
	ngx.say(self.msg)
end

return _M
