#!/usr/bin/env awk -f

# Extracts fenced code blocks (the ones delimited by ```) from markdown documents
# and separates them with 0 byte.
# This way it can be fed into xargs even if the codeblocks contain newlines.
# ./extract-code.awk README.md | xargs -0 -L 1 printf "Block:\n------\n%s\n"

BEGIN { IN_BLOCK = 0; }

/^```/ {
  if (IN_BLOCK) {
    IN_BLOCK = 0;
    printf("%c", 0)
  } else {
    IN_BLOCK = 1;
  }
}

!/^```/ { if (IN_BLOCK) print; }
