.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
 
  @ 7) Indicar el inconveniente en cada una de las siguientes instrucciones
  @ ARM e indicar otra alternativa válida:

  eor r7, r7
  eor r3, r3
  mov r7, #5

  @ a) add r3, r7, #1023 --------------------------------------------------
 
  @ El problema es que 1023 no es un valor inmediato representable mediante
  @ rotacion de un valor de 8 bits.

  @ Una alternativa sería:

  ldr r4, =1023
  add r3, r7, r4

  @ Pero usar ldr es costoso en este caso, porque como 1024 no es representable
  @ ldr usa un literal pool para cargar el valor en r4.
  @ Una alternativa más optimizada sería:

  add r3, r7, #1024
  sub r3, r3, #1

  @ b) sub r11, r12, r3, LSL #32  ----------------------------------------
  eor r3, r3
  eor r11, r11
  eor r12, r12

  @ En este si pudieramos rotar 32 veces, con LSL se destruiria todo el dato.
  @ No podemos rotar 32 veces porque el barrel shifter aloca solo 5 bits al
  @ valor de rotacion, por lo tanto solo podemos rotar hasta 31 veces.
  @ La intruccion es equivalente a cargar r12 en r11:

  mov r11, r12
  @  ---------------------------------------------------------------------
 
  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
