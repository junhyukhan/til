#!/bin/bash
# Generate list of .md files and format as markdown links
find -s . -name "*.md" | awk '{print "[" $1 "](" $1 ")"}'
