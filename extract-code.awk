#!/usr/bin/env awk -f

# Extracts fenced code blocks (the ones delimited by ```) from markdown documents
# and separates them with 0 byte.
# This way it can be fed into xargs even if the codeblocks contain newlines.
# ./extract-code.awk README.md | xargs -0 -L 1 printf "Block:\n------\n%s\n"

function getBacktickCount(line) {
  match(line, /^`*/)
  return RLENGTH
}

BEGIN { IN_BLOCK = 0; }

{
  N = getBacktickCount($0);

  if (IN_BLOCK) {
    if (IN_BLOCK == N) {
      IN_BLOCK = 0;
      printf("%c", 0)
    } else {
      print;
    }
  } else {
    if (N >= 3) {
      IN_BLOCK = N;
    }
  }
}
