.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
 
  @ 4) ¿Qué constante se cargarı́a en el registro r7 con las
  @ siguientes instrucciones?

  @ a)
  eor r7, r7
  mov r7, #0x8C, 4 @ r7 = 0xc0000008

  @ b)
  mov r7, #0x42, 30 @ r7 = 0x108

  @ c)
  mvn r7, #2 @ r7 = 0xfffffffd

  @ d)
  mvn r7, #0x8C, 4 @ r7 = 0xcffffff7

  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
