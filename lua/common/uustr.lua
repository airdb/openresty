local _M = { _VERSION = '0.1' }
local mt = { __index = _M }

-- Wrr(weighted-round-robin) algorithm reference:
-- https://colobu.com/2016/12/04/smooth-weighted-round-robin-algorithm/

function _M.new(_)
	local self = setmetatable({
		msg = "this is smooth_wrr module.",
	}, mt)

	return self
end

function _M.randomStr(len)
  local rankStr = ""
  local randNum = 0
  for i=0,len do
    if math.random(1,3)==1 then
      randNum=string.char(math.random(0,26)+65)
    elseif math.random(1,3)==2 then
      randNum=string.char(math.random(0.26)+97)
    else
      randNum=math.random(0,10)
    end
    rankStr=rankStr..randNum
  end
  return rankStr
end

return _M
