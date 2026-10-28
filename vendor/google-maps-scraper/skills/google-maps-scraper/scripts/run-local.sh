#!/usr/bin/env bash

set -euo pipefail

usage() {
	cat <<'EOF'
Usage: run-local.sh --queries FILE --output-dir DIR [options]

Options:
  --format csv|json       Output format (default: csv)
  --lang CODE             Google Maps language (default: en)
  --depth 1               Search depth (fixed at 1)
  --skip-image-pull       Reuse the image checked earlier in this workflow
  --dry-run               Print the secret-safe Docker command without running it
EOF
}

queries_file=""
output_dir=""
output_format="csv"
lang_code="en"
depth="1"
skip_image_pull=false
dry_run=false

while (($# > 0)); do
	case "$1" in
		--queries)
			queries_file=${2:-}
			shift 2
			;;
		--output-dir)
			output_dir=${2:-}
			shift 2
			;;
		--format)
			output_format=${2:-}
			shift 2
			;;
		--lang)
			lang_code=${2:-}
			shift 2
			;;
		--depth)
			depth=${2:-}
			shift 2
			;;
		--skip-image-pull)
			skip_image_pull=true
			shift
			;;
		--dry-run)
			dry_run=true
			shift
			;;
		--help | -h)
			usage
			exit 0
			;;
		*)
			printf 'Unknown option: %s\n' "$1" >&2
			usage >&2
			exit 2
			;;
	esac
done

if [[ -z "$queries_file" || ! -f "$queries_file" ]]; then
	echo "--queries must name an existing file." >&2
	exit 2
fi

query_count=0
while IFS= read -r query || [[ -n "$query" ]]; do
	if [[ -n "${query//[[:space:]]/}" ]]; then
		((query_count += 1))
	fi
done < "$queries_file"

if ((query_count < 1 || query_count > 3)); then
	echo "--queries must contain between 1 and 3 non-empty queries." >&2
	exit 2
fi

if [[ -z "$output_dir" ]]; then
	echo "--output-dir is required." >&2
	exit 2
fi

if [[ "$output_format" != "csv" && "$output_format" != "json" ]]; then
	echo "--format must be csv or json." >&2
	exit 2
fi

if [[ "$depth" != "1" ]]; then
	echo "--depth is fixed at 1 for targeted searches." >&2
	exit 2
fi

absolute_file() {
	local directory
	local filename
	directory=$(cd "$(dirname "$1")" && pwd)
	filename=$(basename "$1")
	printf '%s/%s\n' "$directory" "$filename"
}

mkdir -p "$output_dir"
queries_file=$(absolute_file "$queries_file")
output_dir=$(cd "$output_dir" && pwd)

container_name="gmaps-scraper-agent"
image_name="gosom/google-maps-scraper"
result_name="results.$output_format"

docker_args=(
	run -d
	--name "$container_name"
	-v "gmaps-playwright-cache:/opt"
	-v "$queries_file:/queries.txt:ro"
	-v "$output_dir:/out"
)

docker_args+=(
	"$image_name"
	-input /queries.txt
	-results "/out/$result_name"
	-depth "$depth"
	-lang "$lang_code"
	-exit-on-inactivity 3m
)

if [[ "$output_format" == "json" ]]; then
	docker_args+=(-json)
fi

if $dry_run; then
	printf 'docker'
	printf ' %q' "${docker_args[@]}"
	printf '\n'
	exit 0
fi

if ! command -v docker >/dev/null 2>&1; then
	echo "Docker is not installed or is not available on PATH." >&2
	exit 1
fi

if ! docker info >/dev/null 2>&1; then
	echo "Docker is installed, but the Docker daemon is not running." >&2
	exit 1
fi

image_available=false
if docker image inspect "$image_name" >/dev/null 2>&1; then
	image_available=true
fi

if ! $skip_image_pull || ! $image_available; then
	if ! docker pull "$image_name"; then
		echo "The first image pull failed; retrying once." >&2
		if ! docker pull "$image_name"; then
			if ! $image_available; then
				echo "Unable to download the Google Maps Scraper Docker image." >&2
				exit 1
			fi
			echo "Could not check for a newer Docker image. Continuing with the installed image." >&2
		fi
	fi
fi

if docker inspect "$container_name" >/dev/null 2>&1; then
	container_status=$(docker inspect --format '{{.State.Status}}' "$container_name")
	if [[ "$container_status" == "running" ]]; then
		echo "A Google Maps Scraper agent crawl is already running." >&2
		exit 1
	fi
	docker rm "$container_name" >/dev/null
fi

docker "${docker_args[@]}"
printf 'Results will be written to %s/%s\n' "$output_dir" "$result_name"
