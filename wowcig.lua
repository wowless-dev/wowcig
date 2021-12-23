local ngx = require('ngx')
local args = ngx.req.get_uri_args()
local cmd = {
  'env',
  'HOME=root',
  '/usr/local/bin/wowcig',
  '-z',
  '-c',
  '',
  '-p',
  assert(args.product, 'missing product'),
}
if args.verbose then
  table.insert(cmd, '-v')
end
if type(args.db2) == 'table' then
  table.insert(cmd, '-d ' .. table.concat(args.db2, ' -d '))
elseif type(args.db2) == 'string' then
  table.insert(cmd, '-d ' .. args.db2)
end
os.execute(table.concat(cmd, ' '))
ngx.say('Successfully extracted ' .. args.product .. '. Have a nice day.')
