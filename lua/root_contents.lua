local cjson = require "cjson"

local data = {
  cat = "nyaaaaan"
}
ngx.say(cjson.encode(data))
