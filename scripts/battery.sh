#!/usr/bin/env bash

get_battery_status() {
  local bat device_info state percentage icon

  # Ищем батарею
  bat=$(upower -e | grep -m1 'BAT')
  if [[ -z "$bat" ]]; then
    echo " N/A" # нет батареи
    return
  fi

  # Получаем информацию о батарее
  device_info=$(upower -i "$bat")
  state=$(echo "$device_info" | awk -F': *' '/state/{print $2}')
  percentage=$(echo "$device_info" | awk -F': *' '/percentage/{gsub("%","");print $2}')

  # Защита от пустого вывода
  if [[ -z "$percentage" ]]; then
    echo " N/A"
    return
  fi

  # Иконки для зарядки
  if [[ "$state" == "charging" || "$state" == "fully-charged" ]]; then
    icon="󰂄"
  else
    # Иконки по уровню заряда
    if ((percentage <= 10)); then
      icon="󰂃"
    elif ((percentage <= 20)); then
      icon="󰁻"
    elif ((percentage <= 30)); then
      icon="󰁽"
    elif ((percentage <= 40)); then
      icon="󰁽"
    elif ((percentage <= 50)); then
      icon="󰁾"
    elif ((percentage <= 60)); then
      icon="󰁿"
    elif ((percentage <= 70)); then
      icon="󰂀"
    elif ((percentage <= 80)); then
      icon="󰂁"
    elif ((percentage <= 90)); then
      icon="󰂂"
    else
      icon="󰁹"
    fi
  fi

  echo "$icon ${percentage}%"
}

get_battery_status
