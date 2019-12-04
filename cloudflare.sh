#!/bin/bash
commit_url="https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/purge_cache"
data=$(cat <<EOF
    {
    "files":["$CF_HOST"]
    }
EOF
)

curl -XPOST "$commit_url" -d "$data" \
    -H "X-Auth-Email: $CF_EMAIL" \
    -H "X-Auth-Key: $CF_API_KEY" \
    -H "Content-Type: application/json"
