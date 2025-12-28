#!/usr/bin/env bash

get_mem_usage() {
  local icon="" # иконка памяти из Nerd Font
  local mem_total mem_avail mem_used mem_pct

  # Берём значения из /proc/meminfo
  mem_total=$(grep -i '^MemTotal:' /proc/meminfo | awk '{print $2}')
  mem_avail=$(grep -i '^MemAvailable:' /proc/meminfo | awk '{print $2}')

  # Защита
  if [[ -z "$mem_total" || -z "$mem_avail" ]]; then
    echo "$icon N/A"
    return
  fi

  mem_used=$((mem_total - mem_avail))
  mem_pct=$((mem_used * 100 / mem_total))

  printf "%s %s%%
" "$icon" "$mem_pct"
}

get_mem_usage
