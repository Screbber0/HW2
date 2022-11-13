	.file	"program.c"
	.text
	.globl	addToPairs
	.type	addToPairs, @function
addToPairs:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L9:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -48(%rbp)
	jne	.L3
	movl	$0, -8(%rbp)
	jmp	.L4
.L8:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movzbl	8(%rdx,%rax), %edx
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L12
	movl	-8(%rbp), %eax
	cltq
	movq	-48(%rbp), %rdx
	subq	$1, %rdx
	cmpq	%rdx, %rax
	jne	.L6
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	112(%rax), %rdx
	addq	$1, %rdx
	movq	%rdx, 112(%rax)
	jmp	.L1
.L6:
	addl	$1, -8(%rbp)
.L4:
	movl	-8(%rbp), %eax
	cltq
	cmpq	%rax, -48(%rbp)
	ja	.L8
	jmp	.L3
.L12:
	nop
.L3:
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L9
	movl	$0, -4(%rbp)
	jmp	.L10
.L11:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movzbl	(%rsi), %edx
	movl	-4(%rbp), %eax
	cltq
	movb	%dl, 8(%rcx,%rax)
	addl	$1, -4(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cltq
	cmpq	%rax, -48(%rbp)
	ja	.L11
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	$1, 112(%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
.L1:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	addToPairs, .-addToPairs
	.section	.rodata
.LC0:
	.string	"%ld \n"
	.text
	.globl	printPairs
	.type	printPairs, @function
printPairs:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L14
.L17:
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movzbl	8(%rdx,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L15:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rcx
	jb	.L16
	movl	$32, %edi
	call	putchar@PLT
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	112(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L14:
	movl	-8(%rbp), %eax
	cltq
	cmpq	%rax, -32(%rbp)
	ja	.L17
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	printPairs, .-printPairs
	.globl	createDictionary
	.type	createDictionary, @function
createDictionary:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$2064, %rsp
	movq	%rdi, -6152(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -6136(%rbp)
	movq	-6152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -6120(%rbp)
	movb	$1, -6141(%rbp)
	movq	$0, -6128(%rbp)
	movl	$0, -6140(%rbp)
	jmp	.L19
.L27:
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L20
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L21
.L20:
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L22
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jle	.L21
.L22:
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L23
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jle	.L21
.L23:
	cmpq	$0, -6128(%rbp)
	je	.L24
	movq	-6128(%rbp), %rcx
	leaq	-112(%rbp), %rdx
	leaq	-6136(%rbp), %rsi
	leaq	-6112(%rbp), %rax
	movq	%rax, %rdi
	call	addToPairs
.L24:
	movb	$1, -6141(%rbp)
	movq	$0, -6128(%rbp)
	jmp	.L25
.L21:
	cmpq	$0, -6128(%rbp)
	jne	.L26
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L26
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L26
	movb	$0, -6141(%rbp)
	jmp	.L25
.L26:
	cmpb	$0, -6141(%rbp)
	je	.L25
	movl	-6140(%rbp), %eax
	movslq	%eax, %rdx
	movq	-6152(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-6128(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -6128(%rbp)
	movzbl	(%rcx), %edx
	movb	%dl, -112(%rbp,%rax)
.L25:
	addl	$1, -6140(%rbp)
.L19:
	movl	-6140(%rbp), %eax
	cltq
	cmpq	%rax, -6120(%rbp)
	ja	.L27
	movq	-6136(%rbp), %rdx
	leaq	-6112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	printPairs
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	createDictionary, .-createDictionary
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1008, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	stdin(%rip), %rdx
	leaq	-1008(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1008(%rbp), %rax
	movq	%rax, %rdi
	call	createDictionary
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
