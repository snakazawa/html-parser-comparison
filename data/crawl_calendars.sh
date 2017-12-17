#!/bin/bash
page=1
while true;
do
  echo "page "$page
  calendars=$(curl -sS 'https://qiita.com/advent-calendar/2017/calendars?page='${page}'&q=' | sed -E 's/<\/?a[ >]/\n/g' | sed -nE 's/href="(\/advent-calendar\/2017\/[-a-z0-9_]+)".*/\1/p')
  echo $calendars | tr ' ' '\n'
  len=$(echo $calendars | wc -w)
  [ $len -lt 20 ] && exit 0
  sleep 1
  let page++
done

