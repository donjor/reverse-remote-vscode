#!/bin/bash

wd=$(pwd)

if [[ -z $1 || $1 == "." ]]; then
  # blank or equal to "."
  echo "$wd" | nc -q 1 localhost 1234
  exit 0
fi

if [[ $1 == .* ]]; then
  custom_path="$wd${1#.}"
  if [[ -e "$custom_path" ]]; then
    echo "$custom_path" | nc -q 1 localhost 1234
    exit 0
  else
    echo "Error - Path not found: $custom_path"
    exit 1
  fi
fi

full_path="$1"
if [[ -e "$full_path" ]]; then
  # path is valid
  echo "$full_path" | nc -q 1 localhost 1234
  exit 0
fi

echo "Error - Path not found: $full_path"
exit 1