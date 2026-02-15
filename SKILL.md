---
name: deep-trawler
description: Deep research workflow that produces comprehensive multi-page reports. Trigger on "deep research", "deep dive", "research report", "trawl", or "DeepTrawler". Combines Perplexity deep research API with source extraction and synthesis into structured research documents. Do NOT use for quick web searches, simple fact-checking, or questions answerable by regular web_search. This is for comprehensive research only (~$0.50-1.00 per query).
---

# DeepTrawler

Multi-stage deep research workflow. Produces comprehensive reports, not summaries.

## Workflow

### 1. Scope
Define the research question. Break broad topics into 2-4 focused sub-queries. Each sub-query becomes a separate Perplexity deep research call.

### 2. Trawl
For each sub-query, run via Mac mini (API key only readable there — NEVER from sandbox):

```bash
# Run on Mac mini via nodes.run
bash scripts/trawl.sh "your query here" slug-name
```

Saves raw JSON to `logs/trawl-<slug>-raw.json` automatically. **Do not truncate responses.**

### 3. Source Dive
Extract citations from each response. For the top 5-8 most relevant sources:
- `web_fetch` each URL
- Pull key quotes, data points, frameworks
- Save extracted content to `logs/trawl-<slug>-sources.md`

### 4. Synthesize
Combine all trawl results + source content into a structured report:

```
docs/research/<slug>.md
```

Report structure:
- **TL;DR** — 3-5 bullet executive summary
- **Context** — Why this matters, what prompted the research
- **Findings** — Organized by theme/sub-query, with inline citations
- **Key Sources** — Annotated bibliography (URL + what it contributed)
- **Open Questions** — What we still don't know
- **Recommendations** — Actionable next steps

Target: 2000-5000 words. Dense, not padded.

### 5. Cleanup
- Delete raw JSON logs (they contain API responses, not worth keeping)
- Keep source extracts if they contain unique data
- Commit report to git

## Cost Awareness
Each deep research call: ~$0.50-1.00. A 3-query trawl = ~$1.50-3.00. Always state expected cost before running. Get confirmation for >$5 total.

## Output Location
All reports go to `docs/research/<slug>.md` in the workspace.
