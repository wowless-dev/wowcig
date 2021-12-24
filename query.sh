export HOME=/root
gsutil rsync gs://wowless.dev/luadbd luadbd
/usr/local/bin/wowcig -z -v -c "" -d all -p "$1"
gsutil cp -r extracts gs://wowless.dev/extracts
gsutil rsync gs://wowless.dev/luadbd luadbd
