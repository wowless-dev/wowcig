set -eo pipefail
apt-get update
apt-get install -y libreadline-dev libssl-dev libzip-dev m4 unzip
apt-get clean
python3 -m pip install hererocks
hererocks -l 5.1 -r 3.5.0 /usr/local
luarocks install wowcig 0.12.4
luarocks install http
luarocks install net-url
