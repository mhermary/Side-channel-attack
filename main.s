	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"passwords.txt"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	$2053465444, -96(%rbp)
	movb	$0, -92(%rbp)
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L2
	movl	$1, %eax
	jmp	.L8
.L2:
	jmp	.L4
.L7:
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$4, -68(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subl	$2, %eax
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, %edx
	subq	$1, %rdx
	movq	%rdx, -80(%rbp)
	movl	%eax, %edx
	movq	%rdx, %r12
	movl	$0, %r13d
	movl	%eax, %edx
	movq	%rdx, %r14
	movl	$0, %r15d
	movl	%eax, %eax
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -88(%rbp)
	movl	$0, -52(%rbp)
	jmp	.L5
.L6:
	movl	-52(%rbp), %eax
	movl	$0, %edx
	divl	-68(%rbp)
	movl	%edx, %eax
	movl	%eax, %eax
	movzbl	-96(%rbp,%rax), %ecx
	movq	-88(%rbp), %rdx
	movl	-52(%rbp), %eax
	movb	%cl, (%rdx,%rax)
	addl	$1, -52(%rbp)
.L5:
	movl	-52(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jb	.L6
	movq	%rbx, %rsp
.L4:
	movq	-64(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L7
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
.L8:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
