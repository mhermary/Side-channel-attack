	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main.c"
	.section	.rodata
	.align	2
.LC1:
	.ascii	"passwords.txt\000"
	.align	2
.LC2:
	.ascii	"r\000"
	.align	2
.LC3:
	.ascii	"ERROR - Could not open file\000"
	.align	2
.LC4:
	.ascii	"\012Trying out password: %s \000"
	.align	2
.LC5:
	.ascii	"length is: %u\012\000"
	.align	2
.LC6:
	.ascii	" %c\000"
	.align	2
.LC7:
	.ascii	"ERROR - Password lengths did not match\000"
	.global	__aeabi_uidivmod
	.align	2
.LC8:
	.ascii	"ERROR - Password characters did not match\000"
	.align	2
.LC9:
	.ascii	"%c did not match %c\012\000"
	.align	2
.LC10:
	.ascii	"%c matched %c\012\000"
	.align	2
.LC11:
	.ascii	"Nonce PW was %s\012\000"
	.align	2
.LC12:
	.ascii	"Password match: %s\000"
	.align	2
.LC13:
	.ascii	"Incorrect password: %s\000"
	.align	2
.LC0:
	.ascii	"deez\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #108
	ldr	r3, .L19
	sub	r2, fp, #41
	mov	ip, #5
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy
	ldr	r0, .L19+4
	ldr	r1, .L19+8
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L4
	ldr	r0, .L19+12
	bl	puts
	mov	r1, #1
	str	r1, [fp, #-112]
	b	.L3
.L17:
	mov	r3, sp
	str	r3, [fp, #-88]
	mov	r2, #1
	str	r2, [fp, #-84]
	mov	r3, #1
	str	r3, [fp, #-80]
	mov	r3, #4
	str	r3, [fp, #-28]
	sub	r3, fp, #73
	mov	r0, r3
	bl	strlen
	mov	r3, r0
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	sub	r3, fp, #73
	ldr	r0, .L19+16
	mov	r1, r3
	bl	printf
	ldr	r0, .L19+20
	ldr	r1, [fp, #-24]
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L5
.L6:
	ldr	r3, [fp, #-20]
	mvn	r2, #60
	sub	r4, fp, #12
	add	r3, r4, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, .L19+24
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L5:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bls	.L6
	mov	r0, #10
	bl	putchar
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L7
	ldr	r0, .L19+28
	bl	puts
	mov	ip, #0
	str	ip, [fp, #-84]
	b	.L8
.L7:
	mov	r1, #0
	str	r1, [fp, #-80]
.L8:
	ldr	r0, [fp, #-24]
	mov	r1, r0
	mov	r2, #0
	mvn	r3, #0
	mov	r4, #15
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1, lsr #29
	mov	r4, r2, asl #3
	str	r4, [fp, #-104]
	ldr	ip, [fp, #-104]
	orr	ip, r3, ip
	str	ip, [fp, #-104]
	mov	r3, r1, asl #3
	str	r3, [fp, #-108]
	sub	r2, fp, #108
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-108]
	str	r2, [fp, #-104]
	mvn	r3, #0
	mov	r4, #15
	sub	r2, fp, #108
	ldmia	r2, {r1-r2}
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r1, r0
	mov	r2, #0
	mvn	r3, #0
	mov	r4, #15
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1, lsr #29
	mov	r4, r2, asl #3
	str	r4, [fp, #-96]
	ldr	ip, [fp, #-96]
	orr	ip, r3, ip
	str	ip, [fp, #-96]
	mov	r3, r1, asl #3
	str	r3, [fp, #-100]
	sub	r2, fp, #100
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-100]
	str	r2, [fp, #-96]
	mvn	r3, #0
	mov	r4, #15
	sub	r2, fp, #100
	ldmia	r2, {r1-r2}
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r0
	add	r3, r3, #7
	add	r3, r3, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	sub	sp, sp, r3
	str	sp, [fp, #-92]
	ldr	r2, [fp, #-92]
	add	r3, r2, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L9
.L14:
	ldr	r4, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	__aeabi_uidivmod
	mov	r3, r1
	mvn	r2, #28
	sub	ip, fp, #12
	add	r3, ip, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-36]
	strb	r3, [r2, r4]
	ldr	r3, [fp, #-16]
	mvn	r2, #60
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L10
	ldr	r0, .L19+32
	bl	puts
	ldr	r3, [fp, #-16]
	mvn	r2, #60
	sub	r4, fp, #12
	add	r3, r4, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r0, .L19+36
	mov	r2, r3
	bl	printf
	ldr	ip, [fp, #-84]
	cmp	ip, #0
	beq	.L11
	mov	r1, #0
	str	r1, [fp, #-84]
	b	.L13
.L11:
	ldr	r2, [fp, #-80]
	eor	r3, r2, #1
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-80]
	b	.L13
.L10:
	ldr	r3, [fp, #-16]
	mvn	r2, #60
	sub	r4, fp, #12
	add	r3, r4, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mvn	r3, r3
	cmp	r1, r3
	bne	.L13
	ldr	r3, [fp, #-16]
	mvn	r2, #60
	sub	ip, fp, #12
	add	r3, ip, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r0, .L19+40
	mov	r2, r3
	bl	printf
.L13:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L9:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bcc	.L14
	ldr	r3, [fp, #-36]
	ldr	r0, .L19+44
	mov	r1, r3
	bl	printf
	ldr	r1, [fp, #-84]
	cmp	r1, #0
	beq	.L15
	sub	r3, fp, #73
	ldr	r0, .L19+48
	mov	r1, r3
	bl	printf
	b	.L16
.L15:
	sub	r3, fp, #73
	ldr	r0, .L19+52
	mov	r1, r3
	bl	printf
.L16:
	ldr	sp, [fp, #-88]
.L4:
	sub	r3, fp, #73
	mov	r0, r3
	mov	r1, #32
	ldr	r2, [fp, #-32]
	bl	fgets
	mov	r3, r0
	cmp	r3, #0
	bne	.L17
	ldr	r0, [fp, #-32]
	bl	fclose
	mov	r2, #0
	str	r2, [fp, #-112]
.L3:
	ldr	r3, [fp, #-112]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
