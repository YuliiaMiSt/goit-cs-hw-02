#!/bin/bash

websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
)

log_file="website_status.log"

> "$log_file"

# Перевіряємо кожен сайт
for website in "${websites[@]}"
do
  # Виконуємо запит curl із перевіркою статусу та переадресації
  status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")

  # Перевірка статус-коду
  if [ "$status_code" -eq 200 ]; then
    echo "<$website> is UP" | tee -a "$log_file"
  else
    echo "<$website> is DOWN" | tee -a "$log_file"
  fi

done

# Виведення інформації про завершення
echo "Результати перевірки записано у файл: $log_file"
