use64 ;directive or flag
processor cpu64_v8

org 0x80000   ; entry point


; making core 0 run


load_processor_core_id:
    mrs x0, MPIDR_EL1
    and x0, x0, #0x3
    cbz x0, main

hang_cpu:
    wfe
    b hang_cpu

; GPIO registers

GPIO_BASE = 0xFE200000

GPFSEL2 = 0x08  ; controls GPIO20–GPIO29
GPSET0  = 0x1C  ; set pin output


; main

main:

    mov x0, GPIO_BASE

    ; configure GPIO21 as output
    mov w1, 0x8
    str w1, [x0, GPFSEL2]

    ; set GPIO21 HIGH
    mov w1, 0x200000
    str w1, [x0, GPSET0]


hang:
    b hang