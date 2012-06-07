.arm
.section .init.text
.org 0
.global _start
_start:
	/* r0: 0
	 * r1: machine type
	 * r2: pointer to atags */
	adr	r4, _start
	ldr	r5, =_start
	sub	r12, r4, r5 /* load address - virtual address, often negative */
	ldr	r4, =atag_ptr
	str	r2, [r4, r12] /* save atag pointer */

	/* zero BSS */
	ldr	r0, =__bss_start
	add	r0, r0, r12
	ldr	r1, =__bss_size
	add	r1, r1, r0 /* end of BSS */
	mov	r2, #0 /* zero for storing */
$$zero_bss_loop:
	cmp	r0, r1
	bge	$$zeroed_bss
	str	r2, [r0], #4
	b	$$zero_bss_loop
$$zeroed_bss:

	/* write global translation tables */
	/* they're in BSS, so they've already been zeroed */
	ldr	r0, =global_translation_tables
	add	r0, r0, r12
	ldr	r1, =__image_start
	add	r2, r1, r12
	ldr	r3, =0b00010001010000000010
	orr	r3, r1, r3

	str	r3, [r0, r1, lsr #18]
	str	r3, [r0, r2, lsr #18] /* identity mapping */

	/* now, enable MMU! */

	mcr	p15,0,r0,c2,c0,0 /* set TTBR0 */
	mcr	p15,0,r0,c2,c0,1 /* and TTBR1 */

	mov	r0, #0b01 /* domain 0 client */
	mcr	p15,0,r0,c3,c0,0 /* write DACR */

	mov	r0, #0b001 /* < 0x80000000 TTBR0, >= 0x80000000 TTBR1 */
	mcr	p15,0,r0,c2,c0,2 /* write TTBCR */

	mov	r0, #0
	mcr	p15,0,r0,c13,c0,1 /* ASID 0 */

	/* http://imgur.com/NRn1f */
	/* TLBs */
	mcr	p15,0,r0,c8,c5,0 /* Instruction TLB */
	mcr	p15,0,r0,c8,c6,0 /* Data TLB */
	mcr	p15,0,r0,c8,c7,0 /* Unified TLB */
	/* Caches */
	mcr	p15,0,r0,c7,c5,0 /* Instruction cache */
	mcr	p15,0,r0,c7,c5,6 /* Branch predictor array */
	/* TODO: Invalidate data/unified cache */

	/* almost there! */
	mrc	p15,0,r0,c1,c0,0 /* read SCTLR */
	orr	r0, r0, #0b1 /* enable MMU */
	orr	r0, r0, #1<<12 /* enable I-cache */
	/* cross your fingers... */
	mcr	p15,0,r0,c1,c0,0 /* write SCTLR */
	dsb	/* just in case */
	isb	/* barrier? I 'ardly even know 'er! */
	
	ldr	pc, =$$final_address
$$final_address:
	/* Hooray! We're running in virtual address space! */
	bl	boot
	bkpt	/* boot() should not return */

.section .bss
.balign 4
.global atag_ptr
atag_ptr:
	.space 4
