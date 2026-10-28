---
name: google-maps-scraper
description: >
  Find a small, targeted set of public local-business leads on Google Maps by niche
  and location. Use for requests such as "find dentists in Campinas" or "compare
  local clinics". Runs locally with Docker; not for mass collection or automated outreach.
license: MIT
metadata:
  author: gosom
  upstream_version: "1.12.1"
  version: "1.12.1-hardened.1"
  repository: "https://github.com/gosom/google-maps-scraper"
  pinned_commit: "903b96d7aa8863188022c04db220e44f3218c860"
allowed-tools: Bash(node:*) Bash(bash:*) Bash(docker:*) Read Write
---

# Google Maps Scraper

Turn a niche-and-location request into a small local Google Maps search and a reviewable CSV of business listings. The bundled workflow requires Docker and Node.js; on Windows, run it through WSL with Docker Desktop integration.

Resolve the directory containing this file as `SKILL_DIR`. Run bundled scripts from that directory; do not assume the current directory is the repository checkout.

## Guardrails

- Search public business listings only. Do not collect sensitive personal data.
- Default to at most three specific niche/location queries per run, depth `1`, CSV, no proxy, no email extraction, and no extra reviews.
- Do not use grid search, mass collection, CAPTCHA bypass, access-control evasion, or automated outreach.
- If Google blocks the crawl, stop and report it. Do not recommend proxy vendors.
- Deduplicate businesses before presenting results and show no more than 20 preview rows.
- Treat results as candidates, not verified leads. Require human review before using contact details or drafting outreach.
- Never send messages, enroll contacts in a sequence, or upload leads to another system without a separate explicit request.
- Preserve partial output when a crawl fails or is interrupted.
- Do not expose raw logs unless a concise excerpt is necessary for diagnosis and contains no secrets.

## Workflow

### 1. Understand the request

Infer sensible defaults and ask only for missing essentials:

1. Business type or search phrase
2. Location
3. Lead signals such as rating, review count, website, phone, or missing website

Default to at most three queries, CSV, no email extraction, no extra reviews, no proxy, and depth `1`. Read [query planning](references/query-planning.md) when translating the request into queries.

Summarize the inferred configuration briefly before setup. Do not ask for confirmation when the intent and location are already clear.

### 2. Prepare queries and validate locally

Write one query per line to a descriptive file under `/tmp`. For a normal first run, create a separate validation file containing one representative query.

Run the validation crawl at depth `1` with a dedicated output directory. Use the bundled execution helper described in [local execution](references/local-execution.md).

The helper starts Docker in the background. Tell the user that the validation has started, then inspect it with the status helper until it completes. A validation succeeds only when the container exits successfully and produces at least one result.

If validation fails, follow [failure recovery](references/recovery.md) before starting the full crawl.

### 3. Run and monitor the full crawl

Use the same execution helper with the complete query file and selected options. When validation already checked the Docker image during this workflow, add `--skip-image-pull` to avoid a redundant network request. Without a preceding validation, keep the default image check. Report:

- That the crawl has started
- Whether the first image download may add startup time
- Container state
- Elapsed time
- Current result count

Poll periodically without blocking the conversation for more than one minute and without streaming logs. Do not promise an exact completion time.

### 4. Present and continue working with results

After a successful crawl, read [result handling](references/results.md). Count the complete result set and show at most 20 preview rows with the most useful available fields:

- Business name
- Category
- Rating and review count
- Phone
- Website
- Address

Deduplicate by `place_id` when present; otherwise use normalized business name plus address. Help the user rank candidates by the requested lead signals. Any later research, personalization, or outreach is a separate workflow and must retain human review.

## Reference routing

- Read [query planning](references/query-planning.md) for query construction, defaults, and language.
- Read [local execution](references/local-execution.md) for exact validation, run, and status commands.
- Read [failure recovery](references/recovery.md) when setup or a crawl fails.
- Read [result handling](references/results.md) when previewing, analyzing, filtering, or exporting results.
