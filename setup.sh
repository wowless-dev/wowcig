set -eo pipefail
echo deb http://packages.cloud.google.com/apt gcsfuse-buster main |
  tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |
  apt-key add -
apt-get update
apt-get install -y gcsfuse libzip-dev tini
apt-get clean
python3 -m pip install hererocks
hererocks -l 5.1 -r 3.5.0 /usr/local
luarocks install wowcig 0.12.4
luarocks install http
luarocks install net-url
mkdir logs mount
ln -s mount/extracts .
ln -s "$PWD/mount/luadbd" /root/.cache/luadbd
