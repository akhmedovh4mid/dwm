#!/usr/bin/env bash

get_cpu_usage() {
  local icon="" # иконка CPU из Nerd Font

  # Берём среднюю загрузку всех ядер за небольшой интервал
  # Первый чтение /proc/stat → пауза → второе чтение → считаем разницу
  read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat
  prev_idle=$((idle + iowait))
  prev_non_idle=$((user + nice + system + irq + softirq + steal))
  prev_total=$((prev_idle + prev_non_idle))

  sleep 0.3

  read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat
  idle_now=$((idle + iowait))
  non_idle_now=$((user + nice + system + irq + softirq + steal))
  total_now=$((idle_now + non_idle_now))

  totald=$((total_now - prev_total))
  idled=$((idle_now - prev_idle))

  cpu_usage=$(((100 * (totald - idled)) / totald))

  printf "%s %s%%
" "$icon" "$cpu_usage"
}

get_cpu_usage
