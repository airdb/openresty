ngx.say("hello")
cjson = require("cjson")
-- ngx.say(ngx.req)
-- local city = require("ipdb.city")
-- ngx.say("----")
-- ipdb = city:new("/etc/nginx/conf/lua/ipdb/mydata4vipday4.ipdb")

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


ngx.say("hello")
