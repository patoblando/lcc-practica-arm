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
  ldr r2, =0xC0000034

  @ b) 0x12340000
  @ x12340000 = 0001 0010 0011 0100 0... = 1 0010 0011 0
  @ De 1 a 1 hay más de 8 bits. No puedo hacer una rotación de un valor
  @ de 8 bits para llegar a cargar ese valor inmediato.
  ldr r2, =0x12340000

  @ c) 0x77777777
  @ No se puede. Hay muchos ceros en el medio como para usar
  @ mvn con algun valor rotable.
  ldr r2, =0x77777777

  @ d) 0xFFFFFFFF
  @ Este si se puede, podemos cargar un 0 negado. Podemos ver en
  @ gdb que las siguientes instrucciones son identicas con dissasemble.
  ldr r2, =0xFFFFFFFF
  mvn r2, #0

  @ e) 0xFFFFFFFE
  @ Analogo al anterior, las siguientes insturcciones se
  @ traducen  lo mismo:
  ldr r2, =0xFFFFFFFE
  mvn r2, #0x1
 
  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
