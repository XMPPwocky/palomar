.section .bss
.align 3
_bootstack_bottom:
	.space 1024
_bootstack_top:

.arm
.section .text
.align 2
.global _start
_start:
	adr	r4, _start
	ldr	r5, =_start
	sub	r4, r4, r5 /* load address - virtual address, usually negative */
	ldr	r5, =_bootstack_top
	add	sp, r5, r4 /* load address of bootstack_top */
	bl	earlyboot
	bkpt
