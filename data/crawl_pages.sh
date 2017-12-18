#!/bin/bash

while read -r page;
do
  filename=$(echo ${page} -n | sha1sum | cut -d " " -f1)'.html'
  dist='pages'/${filename}
  ignore_dist='ignore_pages'/${filename}
  if [ ! -e "${dist}" -a ! -e "${ignore_dist}" ]; then
    echo 'curl -sS -L '${page}' -o '${dist}
    curl -sS -L ${page} -o ${dist}

    if [ ! $(file -i ${dist} | sed -E 's/.*charset=(.*)/\1/g') = 'utf-8' ]
    then
      echo "mv "${dist}" "${ignore_dist}
      mv ${dist} ${ignore_dist}
    fi

    sleep 1
  fi
done

