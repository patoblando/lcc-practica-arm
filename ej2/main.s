.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
 
  @Ejercicio 2
  ldr r3, =array @ Si le pongo 0x8000 da claramente seg fault
 
  @ a)
  mov r6, #5
  str r6, [r3, #12] @   r3 = 0x8000, r3[3] = r6
 
  @ b)
  mov r7, #0xf
  strb r7, [r3], #4 @   r3 = 0x8004
 
  @ c)
  ldrh r5, [r3], #8 @   r3 = 0x800c
 
  @ d)
  ldr r12, [r3, #12]! @ r3 = 0x8018

  @ Extra: Array queda asi: 0xf, 20, 30, 5, 50, 60, 70, 80, 90, 100
  @        Los registros quedan: r5 = 20, r12 = 70

  mov r7, #1
  mov r0, #0
  svc #0

.section .note.GNU-stack,"",%progbits
