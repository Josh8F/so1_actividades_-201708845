#!/bin/bash

# Leer la variable de entorno GITHUB_USER
GITHUB_USER=${GITHUB_USER}

# Verificar si la variable GITHUB_USER está vacía
if [[ -z "$GITHUB_USER" ]]; then
    echo "La variable GITHUB_USER está vacía. Por favor, establezca la variable y vuelva a intentarlo."
    exit 1
fi

# Consultar los datos del usuario de GitHub
RESPONSE=$(curl -s "https://api.github.com/users/${GITHUB_USER}")

# Extraer los datos necesarios del JSON
USER_NAME=$(echo $RESPONSE | jq -r '.login')
USER_ID=$(echo $RESPONSE | jq -r '.id')
CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola ${USER_NAME}. User ID: ${USER_ID}. Cuenta fue creada el: ${CREATED_AT}."

# Crear directorio de log basado en la fecha
LOG_DIR="/tmp/$(date +%F)"
mkdir -p "${LOG_DIR}"

# Escribir el mensaje en el archivo de log
echo "Hola ${USER_NAME}. User ID: ${USER_ID}. Cuenta fue creada el: ${CREATED_AT}." >> "${LOG_DIR}/saludos.log"
