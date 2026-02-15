# DeepTrawler 🔱

Deep research skill for [OpenClaw](https://github.com/openclaw/openclaw). Produces comprehensive multi-page reports using Perplexity's deep research API.

## What It Does

Multi-stage research workflow:
1. **Scope** — Break broad topics into focused sub-queries
2. **Trawl** — Run deep research via Perplexity API (~$0.50-1.00 per query)
3. **Source Dive** — Extract key data from top citations
4. **Synthesize** — Combine into a structured 2,000-5,000 word report
5. **Cleanup** — Commit report, clean temp files

## Install

```bash
openclaw skill install sene1337/deep-trawler
```

Or clone directly into your skills directory.

## Triggers

Say any of: "deep research", "deep dive", "research report", "trawl", or "DeepTrawler"

**Does NOT trigger on:** quick web searches, simple fact-checking, or questions answerable by regular web search.

## Output

Reports go to `docs/research/<slug>.md` with:
- TL;DR executive summary
- Findings organized by theme with inline citations
- Annotated bibliography
- Open questions and recommendations

## Cost

Each deep research call: ~$0.50-1.00. A typical 3-query trawl costs ~$1.50-3.00. The skill states expected cost and asks for confirmation above $5.

## Requirements

- OpenClaw with Perplexity API access (via OpenRouter)
- API key must be readable on the execution host

## License

MIT
