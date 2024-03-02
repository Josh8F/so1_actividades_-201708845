#!/bin/bash
while true; do
  # Leer mensaje del cliente 1
  mensaje_1=$(cat tubo_1)

  # Enviar mensaje al cliente 2
  echo "Mensaje del servidor al cliente 2" > tubo_2

  # Leer mensaje del cliente 2
  mensaje_2=$(cat tubo_2)

  # Enviar mensaje al cliente 1
  echo "Mensaje del servidor al cliente 1" > tubo_1
done
