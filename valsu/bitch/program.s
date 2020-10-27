	.file	"program.c"
	.text
	.section	.rodata
.LC5:
	.string	"\nScore      : %f / %f"
.LC6:
	.string	"\nPercentage : %f\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -32(%rbp)
	movss	.LC1(%rip), %xmm0
	movss	%xmm0, -28(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -24(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-24(%rbp), %xmm2
	movss	-28(%rbp), %xmm1
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movaps	%xmm2, %xmm3
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movl	%eax, -36(%rbp)
	movss	-36(%rbp), %xmm0
	call	score_calc
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	movss	-28(%rbp), %xmm0
	movl	-32(%rbp), %eax
	movaps	%xmm0, %xmm1
	movl	%eax, -36(%rbp)
	movss	-36(%rbp), %xmm0
	call	total_calc
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	cvtss2sd	-8(%rbp), %xmm1
	cvtss2sd	-12(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movss	-8(%rbp), %xmm0
	movl	-12(%rbp), %eax
	movaps	%xmm0, %xmm1
	movl	%eax, -36(%rbp)
	movss	-36(%rbp), %xmm0
	call	perc_calc
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	cvtss2sd	-4(%rbp), %xmm0
	leaq	.LC6(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	score_calc
	.type	score_calc, @function
score_calc:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movss	%xmm2, -28(%rbp)
	movss	%xmm3, -32(%rbp)
	movss	-20(%rbp), %xmm0
	mulss	-28(%rbp), %xmm0
	movss	-24(%rbp), %xmm1
	mulss	-32(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	score_calc, .-score_calc
	.globl	total_calc
	.type	total_calc, @function
total_calc:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	total_calc, .-total_calc
	.globl	perc_calc
	.type	perc_calc, @function
perc_calc:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movss	-20(%rbp), %xmm0
	divss	-24(%rbp), %xmm0
	movss	.LC7(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	perc_calc, .-perc_calc
	.section	.rodata
	.align 4
.LC0:
	.long	1092616192
	.align 4
.LC1:
	.long	1082130432
	.align 4
.LC2:
	.long	1073741824
	.align 4
.LC3:
	.long	1086324736
	.align 4
.LC7:
	.long	1120403456
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
