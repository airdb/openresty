cjson = require("cjson")

-- make sure define lua_package_path in nginx.conf
local hello = require("conf.lua.ipdb.hello")
hello.new()

-- local city = require("conf.lua.ipdb.city")
-- ipdb = city:new("/conf/lua/ipdb/mydata4vipday4.ipdb")

-- local loc = ipdb:findArray("123.125.114.144", "CN");

-- ngx.say(loc)
local json = {}
json["ret"] = "ok"
json["data"] = loc
ngx.say(cjson.encode(json))
--
-- ngx.say(loc[5])
-- ngx.say(table.getn(loc))
-- ngx.log(ngx.INFO, loc[10])
-- ngx.flush()
--
-- ngx.say(ngx.md5("hello"))
-- ngx.exit()

-- ngx.say("hello")
