local _M = { _VERSION = '0.1' } 
local mt = { __index = _M }

-- Wrr(weighted-round-robin) algorithm reference: 
-- https://colobu.com/2016/12/04/smooth-weighted-round-robin-algorithm/

function _M.new(_)
	local node = {}
	local self = setmetatable({
		msg = "this is smooth_wrr module.",
	}, mt)

	return self
end

function _M.test(self)
	local node1 = {}
	node1.Name = "a"
	node1.Current = 0
	node1.Weight = 5
	
	local node2 = {}
	node2.Name = "b"
	node2.Current = 0
	node2.Weight = 1

	local node3 = {}
	node3.Name = "c"
	node3.Current = 0
	node3.Weight = 1

	local nodes = {}
	table.insert(nodes, node1)
	table.insert(nodes, node2)
	table.insert(nodes, node3)

	ngx.say(nodes[3].Name)

	for i = 0, 7, 1
	do
		-- ngx.say(i)
		local best = self:smooth_wrr(nodes)
	        if best == nil then
			ngx.say("can't found best")
		end
		ngx.say("index: ",  i, ", best node: ", best.Name)
	end

end

function _M.smooth_wrr(self, nodes)
	-- ngx.say(nodes[1].Name)
	-- ngx.say(table.getn(nodes))
	local best = nil
	if table.getn(nodes) == 0 then
		return
	end

	local total = 0

	for i, node in ipairs(nodes) do
		if node == nil then
			break
		end

		total = total + node.Weight
		node.Current = node.Current + node.Weight
		if best == nil or node.Current > best.Current then
			best = node
		end
	end

	if best == nil then
		return
	end

	best.Current = best.Current - total
	return best
end

return _M
