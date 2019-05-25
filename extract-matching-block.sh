#!/usr/bin/env bash

# Extracts the fenced code blocks from the `FILE` markdown document
# matching the `GREP_PATTERN` grep regular expression.

if [[ $# -ne 2 ]]; then
  {
    echo "Usage:"
    printf "  %s <GREP_PATTERN> <FILE>" "$(basename $0)"
  } >&2
  exit 1
fi

PATTERN="$1"
FILENAME="$2"

awk -f ./extract-code.awk "$FILENAME" | while read -d '' code; do
  printf '%s' "$code" | grep -z "$PATTERN" | head --bytes=-1 # grep -z outputs a trailing 0 byte without any explanation
done

