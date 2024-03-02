#!/bin/bash

# Crear pipes si no existen
if [ ! -p pipe1 ]; then
    mkfifo pipe1
fi

if [ ! -p pipe2 ]; then
    mkfifo pipe2
fi

echo "Chat A iniciado. Escribe 'salir' para salir."
trap "echo 'saliendo...' > pipe2; rm -f pipe1 pipe2; exit" EXIT

# Proceso para leer mensajes de B
tail -f pipe1 | while read line; do
    if [ "$line" == "salir" ]; then
        echo "Participante B ha salido del chat."
        exit 0
    fi
    echo "B dijo: $line"
done &

# Proceso para enviar mensajes a B
while read line; do
    if [ "$line" == "salir" ]; then
        echo "salir" > pipe2
        exit 0
    fi
    echo "$line" > pipe2
done
