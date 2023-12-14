#!/bin/bash

mix() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <link_file> <endpoint>"
    exit 1
  fi

  link_file="$1"
  endpoint="$2"

  while IFS= read -r link; do
    if [[ $link == *'?'* ]]; then
      link="${link%?}"
    fi

    new_link="$link$endpoint"
    echo "$new_link"
  done < "$link_file"
}
