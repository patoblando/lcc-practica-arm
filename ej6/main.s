.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
 
  @ 6) Indique si las siguientes constantes se pueden cargar o no en un
  @    registro sin crear un literal pool y usando solo una instrucción:

  eor r2, r2

  @ a) 0xC0000034
  @ 0xC0000034 = 1100 0000 0000 0000 0000 0011 0100 = 1101 0011 >> 2
  @ Puedo guardarlo con una unica instrucción, se codifica como 1d3
  mov r2, #0xC0000034

  @ b) 0x12340000

  @ c) 0x77777777

  @ d) 0xFFFFFFFF

  @ e) 0xFFFFFFFE
 
  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
