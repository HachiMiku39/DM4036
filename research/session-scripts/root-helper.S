.syntax unified
.arm
.global _start
.text
_start:
    mov r0, #0
    mov r7, #46
    svc #0
    cmp r0, #0
    bne failed
    mov r0, #0
    mov r7, #23
    svc #0
    cmp r0, #0
    bne failed
    adr r0, shell_path
    add r1, sp, #4
    str r0, [r1]
    mov r2, #0
    mov r7, #11
    svc #0
failed:
    mov r0, #77
    mov r7, #1
    svc #0
shell_path:
    .asciz "/system/bin/sh"
