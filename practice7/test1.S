.section .bss
    buffer: .skip 256

.section .data
    filename: .asciz "testfile.txt"
    message: .asciz "Hello, Assembly!\n"

.section .text
    .global _start

_start:
    ldr x0, =buffer
    mov x1, #256
    mov x8, #17
    svc #0

    mov x0, #1
    ldr x1, =buffer
    mov x2, #256
    mov x8, #64
    svc #0

    mov x0, #56
    ldr x1, =filename
    mov x2, #0x241
    mov x3, #0644
    svc #0
    mov x9, x0

    mov x0, x9
    ldr x1, =message
    mov x2, #17
    mov x8, #64
    svc #0

    mov x0, x9
    mov x8, #57
    svc #0

    mov x0, #52
    ldr x1, =filename
    mov x2, #0755
    svc #0

    mov x0, #1
    mov x8, #93
    svc #0
