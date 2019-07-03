ngx.header.Server = 'AGW'

local uustr = require("lua.common.uustr")
ngx.header['x-airdb-request-id'] = uustr.randomStr(64)
-- X-Served-By:
--
ngx.say(ngx.var.REMOTE_ADDR)

local city = require("lua.ipdb.city")
-- ipdb = city:new("/usr/local/openresty/nginx/lua/ipdb/mydata4vipday4.ipdb")
local ipdb = city:new("lua/ipdb/mydata4vipday4.ipdb")

local ip = '123.125.114.144'
local loc = ipdb:find(ip, "EN")

local cjson = require("cjson")
local json = {}
json["ret"] = "ok"
json["data"] = loc
ngx.say(loc['country_name'])
ngx.say(loc['country_code'])
ngx.say(loc['region_name'])
ngx.say(loc['city_name'])
ngx.say(loc['idd_code'])
ngx.say(cjson.encode(json))
