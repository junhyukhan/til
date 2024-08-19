# TIL (today I learned)
This repository will contain the things I have learned today.

## The structure
The notes will be organized in folders depending on their subject, and subfolders should be limited as much as possible.

## The process
1. During the day, take handwritten notes whenever I have come across a new thing. This can be as small as a stackoverflow thread, a new vim command, or a new VS code extension that seems useful.
1. Transfer the handwritten notes on to this repo.

## List of Entries
[./README.md](./README.md)
[./git/discard-local-git-changes.md](./git/discard-local-git-changes.md)
[./git/generate-apply-patches.md](./git/generate-apply-patches.md)
[./javascript/double-exclaimation.md](./javascript/double-exclaimation.md)
[./kernel/contributing.md](./kernel/contributing.md)
[./mac/open-iterm-finder-toolbar.md](./mac/open-iterm-finder-toolbar.md)
[./python/partition_list.md](./python/partition_list.md)
[./python/reversing-nodes-in-kgroup.md](./python/reversing-nodes-in-kgroup.md)
[./python/rotate_list.md](./python/rotate_list.md)
[./python/simple-string-cleaning.md](./python/simple-string-cleaning.md)
[./python/sliding_door.md](./python/sliding_door.md)

### Making the above list
The script:
```bash
# Run this script to generate the list of .md files and format them as links in markdown
# generate_list.sh
find . -name "*.md" | awk '{print "[" $1 "](" $1 ")"}'
```
Run:
```bash
chmod +x generate_list.sh
./generate_list.sh
```
