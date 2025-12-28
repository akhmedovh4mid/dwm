#!/usr/bin/env bash

get_volume_status() {
  local mute icon vol

  mute=$(pamixer --get-mute 2>/dev/null)
  vol=$(pamixer --get-volume 2>/dev/null)

  # Если не удалось получить громкость
  if [[ -z "$vol" ]]; then
    echo " N/A"
    return
  fi

  # Mute
  if [[ "$mute" == "true" ]]; then
    echo " ${vol}%"
    return
  fi

  # Иконка по уровню
  if [[ "$vol" -ge 70 ]]; then
    icon=""
  elif [[ "$vol" -ge 30 ]]; then
    icon=""
  elif [[ "$vol" -gt 0 ]]; then
    icon=""
  else
    icon=""
  fi

  echo "$icon ${vol}%"
}

get_volume_status
