#!/bin/bash
source ~/.secret

full_balance=$(curl -s -XGET https://kmdexplorer.io/insight-api-komodo/addr/$LAMETRIC_BL_WALLET/ | jq -r '.balance')
balance=$(printf "%.1f\n" "$full_balance")

jq -n --arg balance $balance '{ frames: [ { text: $balance, icon: 25861, index: 0 } ] }' > /dev/shm/lametric-kmd-balance.json

# ToDo: better way

auth_body='{"auth": {"passwordCredentials": {"username": "'"$SELCDN_USERNAME"'", "password": "'"$SELCDN_PASS"'" }}}'
token=$(curl -s -XPOST "https://api.selcdn.ru/v2.0/tokens" -H "Content-type: application/json" -d "$auth_body" | jq -r '.access.token.id' )

# Put

curl -s -XPUT https://api.selcdn.ru/v1/$LAMETRIC_SEL_BUCKETPATH -H "X-Auth-Token: $token" -T "/dev/shm/lametric-kmd-balance.json"

