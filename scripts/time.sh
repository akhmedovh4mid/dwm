#!/usr/bin/env bash

get_time() {
  local icon=""
  local time_str

  time_str=$(date '+%H:%M')
  echo "$icon $time_str"
}

get_time
