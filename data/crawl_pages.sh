#!/bin/bash

while read -r page;
do
  dist='pages'/$(echo $page -n | sha1sum | cut -d " " -f1)'.html'
  if [ ! -e "$dist" ]; then
    echo 'curl -sS -L '$page' -o '$dist
    curl -sS -L $page -o $dist
    sleep 1
  fi
done

