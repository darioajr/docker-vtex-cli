#!/bin/bash

vtex_path="$HOME/.vtex/session/";

session_file="session.json"
workspace_file="workspace.json"
token_file="tokens.json"

vtex_workspace="${VTEX_WORKSPACE}"
vtex_account="${VTEX_ACCOUNT}"
vtex_appkey="${VTEX_APPKEY}"
vtex_apptoken="${VTEX_APPTOKEN}"

mkdir -p $vtex_path

token_curl=$(curl -s --location --request POST "https://vtexid.vtex.com.br/api/vtexid/apptoken/login?an=$vtex_account" \
--header 'Content-Type: application/json' \
--data-raw '{
"appkey": "'$vtex_appkey'",
"apptoken": "'$vtex_apptoken'"
}') || exit

response=$(jq ".account = \"$vtex_account\"" <<<"$token_curl")
jq ".login = \"$vtex_appkey\"" <<<"$response" > "$vtex_path$session_file"

token=$(printf '%s\n' "$response" | jq -r .token)

echo "... successful created session.json"

echo '{
         "currentWorkspace": "'$vtex_workspace'",
         "lastWorkspace": null
}' > "$vtex_path$workspace_file"

echo "... successful created workspace.json"

echo '{
          "'$vtex_account'": "'$token'"
}' > "$vtex_path$token_file"

echo "... successful created tokens.json"
