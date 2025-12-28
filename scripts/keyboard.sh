#!/usr/bin/env bash

get_capslock_state() {
  # Если Caps Lock включён, выводим иконку, иначе — пусто
  if xset q | grep -q "Caps Lock:   on"; then
    echo "󰘲"
  else
    echo ""
  fi
}

get_kb_layout() {
  local icon layout led

  icon=""
  led=$(xset -q | awk '/LED mask/{print $NF}')

  # 5‑й символ == 1 → ru, иначе en (твоя логика)
  if [[ "$(printf '%s' "$led" | awk '{print substr($1,5,1)}')" == "1" ]]; then
    layout="ru"
  else
    layout="en"
  fi

  echo "$icon $layout"
}

caps="$(get_capslock_state)"
kbd="$(get_kb_layout)"

# Если капс пустой — не вставляем лишний пробел
if [[ -n "$caps" ]]; then
  echo "$caps $kbd"
else
  echo "$kbd"
fi
