cjson = require("cjson")

local city = require("lua.ipdb.city")
ipdb = city:new("/usr/local/openresty/nginx/lua/ipdb/mydata4vipday4.ipdb")

local args = ngx.req.get_uri_args()

local uri = string.gsub(ngx.var.request_uri, "?.*", "")
local uri_args = string.gsub(ngx.var.request_uri, ".*?", "")

-- ngx.say(ngx.var.host, " ", uri, " ", uri_args)
local ip = "123.125.114.144"

if args["ip"] ~= nil then
	ip = args["ip"]
end
local loc = ipdb:findArray(ip, "CN")
-- ngx.say(args["ip"])

local json = {}
json["ret"] = "ok"
json["data"] = loc

ngx.say(cjson.encode(json))

--[[
-- make sure define lua_package_path in nginx.conf
local hello = require("lua.ipdb.hello")
hello.new()

ngx.say(ngx.req.get_method())
-- curl http://localhost:9000/xxx?ip=123.125.114.144

local wrr = require("lua.common.smooth_wrr").new()
-- wrr:smooth_wrr()
wrr:test()



-- ngx.say(loc)
--
-- ngx.say(loc[5])
-- ngx.say(table.getn(loc))
-- ngx.log(ngx.INFO, loc[10])
-- ngx.flush()
--
-- ngx.say(ngx.md5("hello"))
-- ngx.exit()

-- ngx.say("hello")
--]]
