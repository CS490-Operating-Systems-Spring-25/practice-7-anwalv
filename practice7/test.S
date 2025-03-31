    .section .data
prompt: .asciz "Enter: "
color_codes: 
    .asciz "\033[40m\033[41m\033[42m\033[44m\033[43m\033[47m\033[46m\033[45m"
buffer: .space 16

    .section .text
    .global _start

_start:
    mov x0, 1
    ldr x1, =prompt
    mov x2, #32
    mov x8, #64
    svc #0

    mov x0, 0
    ldr x1, =buffer
    mov x2, #16
    mov x8, #63
    svc #0

    ldr x1, =buffer
    mov x2, #16
process_loop:
    ldrb w3, [x1], #1
    cmp w3, #0
    beq done_processing
    blt color_black
    cmp w3, #'r'
    beq color_red
    cmp w3, #'g'
    beq color_green
    cmp w3, #'b'
    beq color_blue
    cmp w3, #'y'
    beq color_yellow
    cmp w3, #'w'
    beq color_white
    cmp w3, #'c'
    beq color_cyan
    cmp w3, #'m'
    beq color_magenta
    b process_loop

color_black:
    mov x0, 1
    ldr x1, =color_codes
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_red:
    mov x0, 1
    ldr x1, =color_codes + 4
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_green:
    mov x0, 1
    ldr x1, =color_codes + 8
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_blue:
    mov x0, 1
    ldr x1, =color_codes + 12
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_yellow:
    mov x0, 1
    ldr x1, =color_codes + 16
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_white:
    mov x0, 1
    ldr x1, =color_codes + 28
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_cyan:
    mov x0, 1
    ldr x1, =color_codes + 20
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

color_magenta:
    mov x0, 1
    ldr x1, =color_codes + 24
    mov x2, #7
    mov x8, #64
    svc #0
    b process_loop

done_processing:
    mov x0, 0
    mov x8, #93
    svc #0
