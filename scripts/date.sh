#!/usr/bin/env bash

get_date() {
  local icon=""
  local date_str

  date_str=$(date '+%d.%m')
  echo "$icon $date_str"
}

get_date
