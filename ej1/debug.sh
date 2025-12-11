#!/bin/bash

# --- Configuración ---
GDB_PORT=1234

# --- Validación de Parámetros ---
# Revisa si se pasó un nombre de programa como parámetro
if [ -z "$1" ]; then
  echo "Uso: $0 <nombre_del_programa>"
  exit 1
fi

PROGRAM_NAME=$1

# --- Ejecución ---
echo "Lanzando QEMU en segundo plano en el puerto $GDB_PORT..."
# Lanza qemu en segundo plano y guarda su ID de proceso (PID)
qemu-arm-static -g $GDB_PORT "$PROGRAM_NAME" &
QEMU_PID=$!

# 'trap' es un mecanismo de seguridad. Cuando el script termine (por cualquier razón),
# se asegurará de matar el proceso de QEMU para no dejarlo colgado.
trap "echo 'Limpiando proceso de QEMU (PID: $QEMU_PID)...'; kill $QEMU_PID" EXIT

# Pequeña pausa para asegurar que QEMU esté listo para aceptar conexiones
sleep 0.5

echo "Lanzando GDB y conectando..."
# Lanza gdb-multiarch y le pasa los comandos para conectar, poner un breakpoint y continuar
gdb-multiarch "$PROGRAM_NAME" \
  -ex "target remote localhost:$GDB_PORT" \
  -ex "br main" \
  -ex "continue"

echo "Sesión de GDB terminada."
