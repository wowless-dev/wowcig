local ngx = require("ngx")
local args = ngx.req.get_uri_args()
local product = assert(args.product, "missing product")
local dbargs = ""
if type(args.db2) == "table" then
  dbargs = " -d " .. table.concat(args.db2, " -d ")
elseif type(args.db2) == "string" then
  dbargs = " -d " .. args.db2
end
os.execute("env HOME=/root /usr/local/bin/wowcig -z -v -p " .. product .. dbargs)
ngx.say("Successfully extracted " .. product .. ". Have a nice day.")
