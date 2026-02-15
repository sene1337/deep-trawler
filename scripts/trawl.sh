#!/bin/bash
# Deep research query via Perplexity/OpenRouter
# Usage: bash scripts/trawl.sh "query text" output-slug
# Must run on Mac mini (API key only readable there)

set -euo pipefail

QUERY="$1"
SLUG="${2:-research}"
CONFIG="/Users/seneschal/.openclaw/openclaw.json"
OUTDIR="/Users/seneschal/.openclaw/workspace/logs"

KEY=$(grep -o 'sk-or-v1-[a-f0-9]*' "$CONFIG" | head -1)
if [ -z "$KEY" ]; then
  echo "ERROR: Could not extract API key from $CONFIG" >&2
  exit 1
fi

OUTFILE="$OUTDIR/trawl-${SLUG}-raw.json"

curl -s https://openrouter.ai/api/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $KEY" \
  -d "$(jq -n --arg q "$QUERY" '{model:"perplexity/sonar-deep-research",messages:[{role:"user",content:$q}]}')" \
  > "$OUTFILE"

echo "Saved to $OUTFILE"
