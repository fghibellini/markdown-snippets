
# Extraction of fenced code blocks form markdown documents

## Usage

```bash
extract-matching-block.sh <GREP_PATTERN> <FILE>
```

## Example usage

`ONBOARDING.md`:

````markdown
Welcome to project "destroy_the_world".

Step 1:
```
curl https://nixos.org/nix/install | sh
```

Step 2:
```
nix-shell -p scary-laser-dont-use
scary-laser --help
```
````

```bash
$ extract-matching-block.sh 'nixos\.org' ./ONBOARDING.md
curl https://nixos.org/nix/install | sh

$ extract-matching-block.sh 'nix-shell' ./ONBOARDING.md
nix-shell -p scary-laser-dont-use
scary-laser --help
```
