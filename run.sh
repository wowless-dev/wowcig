set -e
gcsfuse --implicit-dirs wowless.dev mount
/usr/local/openresty/nginx/sbin/nginx -p . -c nginx.conf
