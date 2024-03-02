#!/bin/bash

# Crear pipes si no existen
if [ ! -p pipe1 ]; then
    mkfifo pipe1
fi

if [ ! -p pipe2 ]; then
    mkfifo pipe2
fi

echo "Chat B iniciado. Escribe 'salir' para salir."
trap "echo 'saliendo...' > pipe1; rm -f pipe1 pipe2; exit" EXIT

# Proceso para leer mensajes de A
tail -f pipe2 | while read line; do
    if [ "$line" == "salir" ]; then
        echo "Participante A ha salido del chat."
        exit 0
    fi
    echo "A dijo: $line"
done &

# Proceso para enviar mensajes a A
while read line; do
    if [ "$line" == "salir" ]; then
        echo "salir" > pipe1
        exit 0
    fi
    echo "$line" > pipe1
done
