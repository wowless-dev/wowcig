export HOME=/root
gsutil -m rsync -u gs://wowless.dev/luadbd "$HOME"/.cache/luadbd
/usr/local/bin/wowcig -z -v -c "" -d all -p "$1"
gsutil -m rsync -u extracts gs://wowless.dev/extracts
gsutil -m rsync -u "$HOME"/.cache/luadbd gs://wowless.dev/luadbd
