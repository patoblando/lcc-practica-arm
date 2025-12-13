.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
 
  @ 5) Usando el esquema de rotación de bytes, calcule la instrucción y
  @    la rotación necesarias para cargar las siguientes constantes en el
  @    registro r2:

  eor r2, r2

  @ a) 0xA400
  @ 0xa4 = 1010 0100 0000 0000 = 1010 0100 << 8 = 1010 0100 >> 24

  mov r2, #0xA4
  ror r2, #24
  
  @ b) 0x3D8
  @ 0x3D8 = 0011 1101 1000 = 1111 0110 << 2 = 1111 0110 >> 30
  mov r2, #0xf6
  ror r2, #30

  @ c) 0x17400
  @ 0x17400 = 0001 0111 0100 0000 0000 = 0101 1101 << 10 = 0101 1101 >> 22
  mov r2, #0x5d
  ror r2, #22

  @ d) 0x1980
  @ 0x1980 = 0001 1001 1000 0000 = 0110 0110 << 6 = 0110 0110 >> 26
  mov r2, #0x66
  ror r2, #26
 
  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
