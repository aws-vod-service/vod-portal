#!/bin/bash

# Specify the file to read
script_dir="$(dirname "$0")"
file="$script_dir/builds.env"

# Check if the file exists
if [ -e "$file" ]; then
  # Use grep to find lines matching the pattern and extract the parts 
  # (consider awk?)
  if grep -q "|" "$file"; then
    line=$(grep "|" "$file")
    name="${line%%|*}"     # Extract the part before the pipe
    value="${line#*|}"     # Extract the part after the pipe
    int_value=$((value))   # Convert the value to an integer
    
    # return current build file variable
    #echo "Name: $name"
    
    # return current build file
    echo "$int_value"

  else
    echo "Pattern not found in the file."
  fi
else
  echo "File $file does not exist."
fi
