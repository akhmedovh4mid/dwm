#!/usr/bin/env bash

get_brightness() {
  local percentage icon

  # Получаем яркость в процентах
  percentage=$(brightnessctl -m 2>/dev/null | awk -F, '{gsub("%",""); print $4}')

  # Если не удалось получить значение
  if [[ -z "$percentage" ]]; then
    echo " N/A"
    return
  fi

  if ((percentage >= 86)); then
    icon="󰃠"
  elif ((percentage >= 72)); then
    icon="󰃟"
  elif ((percentage >= 58)); then
    icon="󰃞"
  elif ((percentage >= 44)); then
    icon="󰃝"
  elif ((percentage >= 30)); then
    icon="󰃜"
  elif ((percentage >= 16)); then
    icon="󰃛"
  else
    icon="󰃚"
  fi

  echo "$icon ${percentage}%"
}

get_brightness
