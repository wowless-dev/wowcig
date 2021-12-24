assert(require('http.server').listen({
  host = 'localhost',
  port = 8080,
  onstream = (function()
    local new_headers = require('http.headers').new
    local parse_url = require('net.url').parse
    return function(_, s)
      local q = parse_url(s:get_headers():get(':path')).query
      local product = q.product
      os.execute('env HOME=root /usr/local/bin/wowcig -z -v -c "" -d all -p ' .. product)
      local h = new_headers()
      h:append(':status', '200')
      s:write_headers(h, false)
      s:write_chunk('Successfully extracted ' .. product .. '. Have a nice day.\n', true)
    end
  end)(),
}):loop())
