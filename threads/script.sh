#!/bin/bash

# Check if a file name is provided
if [ -z "$1" ]; then
  echo "Please provide a file name."
  exit 1
fi

# Backup the original file
cp "$1" "$1.bak"

# Remove all comments that have less than 50 characters
awk '
  # Check if the line is a comment
  /^[[:space:]]*\/\// {
    # Check the length of the comment
    if (length <= 50) {
      next
    }
  }
  { print }
' "$1.bak" > "$1"
