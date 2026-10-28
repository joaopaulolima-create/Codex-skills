# Failure Recovery

## Docker is missing

Explain that local execution requires Docker. On Windows, ask the user to start Docker Desktop with WSL integration. Repeat validation only after `docker info` succeeds.

## Docker daemon is stopped

Ask the user to start Docker. Re-run the validation only after `docker info` succeeds.

## Image download fails

The run helper retries once. If both attempts fail, show the concise network or registry error and suggest checking connectivity before retrying.

## Crawl returns no results

Try one wording correction at a time: verify the niche and location, use the local search language, or use a nearby district. Stay within the three-query limit and depth `1`.

## Google blocks the crawl

Stop and report the block. Do not bypass CAPTCHA, recommend a proxy, or increase concurrency.

## Crawl is interrupted or fails

Preserve the output directory and stopped container for inspection. Summarize the actionable error without dumping logs. A retry starts a new targeted crawl; the helper does not provide checkpoint-level resume.
