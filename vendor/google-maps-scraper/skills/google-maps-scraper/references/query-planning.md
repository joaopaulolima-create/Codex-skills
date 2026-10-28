# Query Planning

## Defaults

- Language: infer from the location when obvious; otherwise `en`
- Queries: at most three specific niche/location combinations
- Depth: `1`
- Format: CSV
- Email extraction: disabled
- Extra reviews: disabled
- Proxy: disabled

Ask only about missing information that changes the run. Do not make the user approve defaults they did not question.

## Writing useful searches

Use one clear business type plus one specific city, district, or nearby municipality. Prefer `clínicas odontológicas em Campinas, SP` over a broad term such as `dentistas Brasil`.

Use the local search language when it improves Google Maps matching. Keep one query per line, avoid blank lines, and do not expand a request into more than three queries without a separate explicit request.

Do not describe a scrape as exhaustive. Google Maps ranking, blocking, coverage, and listing changes prevent completeness guarantees.
