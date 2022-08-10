	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"unoptimized.c"
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
	.ascii	"ERROR - Password length must be between 4 and 31.\000"
	.global	__aeabi_uidivmod
	.align	2
.LC5:
	.ascii	"Password match: %s\000"
	.align	2
.LC6:
	.ascii	"Incorrect password: %s\000"
	.align	2
.LC0:
	.ascii	"ThisClassIsFun!\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #148
	ldr	r3, .L25
	sub	ip, fp, #40
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r0, .L25+4
	ldr	r1, .L25+8
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L4
	ldr	r0, .L25+12
	bl	puts
	mov	r0, #1
	str	r0, [fp, #-152]
	b	.L3
.L23:
	mov	r3, sp
	str	r3, [fp, #-104]
#APP
@ 23 "unoptimized.c" 1
	@starting while loop here
@ 0 "" 2
	sub	r3, fp, #72
	mov	r0, r3
	bl	strlen
	mov	r3, r0
	sub	r3, r3, #1
	str	r3, [fp, #-100]
	ldr	r1, [fp, #-100]
	cmp	r1, #3
	bls	.L5
	ldr	r2, [fp, #-100]
	cmp	r2, #31
	bls	.L6
.L5:
	ldr	r0, .L25+16
	bl	puts
	mov	r3, #1
	str	r3, [fp, #-152]
	mov	r4, #0
	str	r4, [fp, #-80]
	b	.L7
.L6:
	mov	ip, #15
	str	ip, [fp, #-96]
	mov	r0, #1
	str	r0, [fp, #-92]
	mov	r1, #1
	str	r1, [fp, #-88]
#APP
@ 48 "unoptimized.c" 1
	@comparing password lengths
@ 0 "" 2
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	beq	.L8
	mov	r4, #0
	str	r4, [fp, #-92]
	b	.L9
.L8:
	mov	ip, #0
	str	ip, [fp, #-88]
.L9:
#APP
@ 62 "unoptimized.c" 1
	@creating concat_pw and inverse_concat_pw
@ 0 "" 2
	ldr	r0, [fp, #-96]
	mov	r1, r0
	mov	r2, #0
	mvn	r3, #0
	mov	r4, #15
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1, lsr #29
	mov	r4, r2, asl #3
	str	r4, [fp, #-144]
	ldr	ip, [fp, #-144]
	orr	ip, r3, ip
	str	ip, [fp, #-144]
	mov	r3, r1, asl #3
	str	r3, [fp, #-148]
	sub	r2, fp, #148
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-148]
	str	r2, [fp, #-144]
	mvn	r3, #0
	mov	r4, #15
	sub	r2, fp, #148
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
	str	r4, [fp, #-136]
	ldr	ip, [fp, #-136]
	orr	ip, r3, ip
	str	ip, [fp, #-136]
	mov	r3, r1, asl #3
	str	r3, [fp, #-140]
	sub	r2, fp, #140
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-140]
	str	r2, [fp, #-136]
	mvn	r3, #0
	mov	r4, #15
	sub	r2, fp, #140
	ldmia	r2, {r1-r2}
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r0
	add	r3, r3, #7
	add	r3, r3, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	sub	sp, sp, r3
	str	sp, [fp, #-128]
	ldr	r2, [fp, #-128]
	add	r3, r2, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-96]
	mov	r1, r0
	mov	r2, #0
	mvn	r3, #0
	mov	r4, #15
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r1, lsr #29
	mov	r4, r2, asl #3
	str	r4, [fp, #-120]
	ldr	ip, [fp, #-120]
	orr	ip, r3, ip
	str	ip, [fp, #-120]
	mov	r3, r1, asl #3
	str	r3, [fp, #-124]
	sub	r2, fp, #124
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-124]
	str	r2, [fp, #-120]
	mvn	r3, #0
	mov	r4, #15
	sub	r2, fp, #124
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
	str	r4, [fp, #-112]
	ldr	ip, [fp, #-112]
	orr	ip, r3, ip
	str	ip, [fp, #-112]
	mov	r3, r1, asl #3
	str	r3, [fp, #-116]
	sub	r2, fp, #116
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-116]
	str	r2, [fp, #-112]
	mvn	r3, #0
	mov	r4, #15
	sub	r2, fp, #116
	ldmia	r2, {r1-r2}
	and	r1, r1, r3
	and	r2, r2, r4
	mov	r3, r0
	add	r3, r3, #7
	add	r3, r3, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	sub	sp, sp, r3
	str	sp, [fp, #-108]
	ldr	r2, [fp, #-108]
	add	r3, r2, #7
	mov	r3, r3, lsr #3
	mov	r3, r3, asl #3
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-20]
	mov	r4, #0
	str	r4, [fp, #-84]
	b	.L10
.L18:
#APP
@ 70 "unoptimized.c" 1
	@starting letter by letter
@ 0 "" 2
	ldr	r4, [fp, #-84]
	ldr	r0, [fp, #-84]
	ldr	r1, [fp, #-100]
	bl	__aeabi_uidivmod
	mov	r3, r1
	mvn	r2, #59
	sub	ip, fp, #12
	add	r3, ip, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	strb	r3, [r2, r4]
	ldr	r4, [fp, #-84]
	ldr	r0, [fp, #-84]
	ldr	r1, [fp, #-96]
	bl	__aeabi_uidivmod
	mov	r3, r1
	mvn	r2, #59
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mvn	r3, r3
	and	r3, r3, #255
	ldr	r2, [fp, #-20]
	strb	r3, [r2, r4]
	ldr	r3, [fp, #-84]
	mvn	r2, #59
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-84]
	mvn	r2, #27
	sub	r4, fp, #12
	add	r3, r4, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L11
	ldr	ip, [fp, #-84]
	add	ip, ip, #1
	str	ip, [fp, #-84]
	ldr	r0, [fp, #-92]
	cmp	r0, #0
	beq	.L12
	mov	r1, #0
	str	r1, [fp, #-92]
	b	.L15
.L12:
	ldr	r2, [fp, #-92]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L14
	ldr	r4, [fp, #-88]
	eor	r3, r4, #1
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-88]
	b	.L15
.L14:
	ldr	ip, [fp, #-88]
	eor	r3, ip, #1
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-88]
	b	.L15
.L11:
	ldr	r3, [fp, #-84]
	mvn	r2, #59
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L15
	ldr	r1, [fp, #-88]
	cmp	r1, #0
	beq	.L16
	mov	r2, #0
	str	r2, [fp, #-88]
	b	.L15
.L16:
	ldr	r4, [fp, #-92]
	eor	r3, r4, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L17
	ldr	ip, [fp, #-88]
	eor	r3, ip, #1
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-88]
	b	.L15
.L17:
	ldr	r0, [fp, #-88]
	eor	r3, r0, #1
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-88]
.L15:
	ldr	r1, [fp, #-84]
	add	r1, r1, #1
	str	r1, [fp, #-84]
.L10:
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	bcc	.L18
#APP
@ 128 "unoptimized.c" 1
	@checking if passwords match
@ 0 "" 2
	ldr	r4, [fp, #-92]
	cmp	r4, #0
	beq	.L19
	sub	r3, fp, #72
	ldr	r0, .L25+20
	mov	r1, r3
	bl	printf
	b	.L20
.L19:
	sub	r3, fp, #72
	ldr	r0, .L25+24
	mov	r1, r3
	bl	printf
.L20:
	mov	ip, #1
	str	ip, [fp, #-80]
.L7:
	ldr	sp, [fp, #-104]
	ldr	r0, [fp, #-80]
	cmp	r0, #1
	bne	.L3
.L4:
	sub	r3, fp, #72
	mov	r0, r3
	mov	r1, #32
	ldr	r2, [fp, #-16]
	bl	fgets
	mov	r3, r0
	cmp	r3, #0
	bne	.L23
	ldr	r0, [fp, #-16]
	bl	fclose
	mov	r1, #0
	str	r1, [fp, #-152]
.L3:
	ldr	r3, [fp, #-152]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L26:
	.align	2
.L25:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
