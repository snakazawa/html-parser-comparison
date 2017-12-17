#!/bin/bash

for file in $(ls pages/);
do
  if [ ! $(file -i pages/$file | sed -E 's/.*charset=(.*)/\1/g') = 'utf-8' ]
  then
    echo "mv pages/"$file" ignore_pages/"$file
    mv pages/$file ignore_pages/$file
  fi
done

