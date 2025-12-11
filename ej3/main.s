.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
  ldr r3, =array @ (Inicializo r3 para poder compilar)
 
  @ Ejercicio 3
  @ Suponiendo una arquitectura ARM little-endian
  setend le @ Utilizamos el modo little-endian

  mov r6, #0x12 @ A modo de ejemplo
  @ a) Que contendria el registro r4 despues de ejcutar las siguientes instrucciones?
  str r6, [r3] @ r3[0] = r6 = 0x12
  ldrb r4, [r3] @ r4 = 0x0
 
  @ b) Que pasaria si fuera big-endian
  setend be
  str r6, [r3] @ r3[0] = r6 = 0x12
  ldrb r4, [r3] @r4 = 0x21000000


  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
