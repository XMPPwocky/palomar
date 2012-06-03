.section .bss
.align 3
_bootstack_bottom:
	.space 1024
_bootstack_top:

.arm
.section .init.text
.org 0
.global _start
_start:
	adr	r4, _start
	ldr	r5, =_start
	sub	r4, r4, r5 /* load address - virtual address, often negative */
	ldr	r5, =_bootstack_top
	add	sp, r5, r4 /* load address of _bootstack_top */
	bl	earlyboot
	bkpt
