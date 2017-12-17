#!/bin/bash

while read -r calendar;
do
  curl -sS 'https://qiita.com'$calendar | sed -E 's/<\/?div[ >]/\n/g' | sed -nE 's/^class="adventCalendarCalendar_comment".*<a .*href="([^"]+)".*$/\1/p'
  sleep 1
done

