set -e
gcsfuse --implicit-dirs wowless.dev mount
(eval "$(luarocks path)" && lua wowcig.lua)
