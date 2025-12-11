.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.text
.global main
main:
  ldr r2, =array
  mov r1, #5          @ r1 (y) = 5
 
  @a) x = array[7] + y;
  mov r4, #7          @ r4 = 7 (el índice)
  @ Carga desde la dirección r2 + (r4 << 2), que es r2 + (7 * 4)
  ldr r3, [r2, r4, LSL #2]
  add r0, r3, r1

  @b) array[10] = array[8] + y;
  mov r4, #9
  str r0, [r2, r4, LSL #2]

  mov r7, #1      @ syscall número 1 es para exit
  mov r0, #0      @ código de salida 0 (éxito)
  svc #0          @ llamar al kernel para que termine el programa

.section .note.GNU-stack,"",%progbits
