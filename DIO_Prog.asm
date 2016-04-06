	.file	"DIO_Prog.c"
	.globl	DIO_u8ArrPORT
	.section .rdata,"dr"
	.align 32
DIO_u8ArrPORT:
	.quad	59
	.quad	56
	.quad	53
	.quad	50
	.globl	DIO_u8ArrDDR
	.align 32
DIO_u8ArrDDR:
	.quad	58
	.quad	55
	.quad	52
	.quad	49
	.globl	DIO_u8ArrPIN
	.align 32
DIO_u8ArrPIN:
	.quad	57
	.quad	54
	.quad	51
	.quad	48
	.text
	.globl	DIO_VoidInit
	.def	DIO_VoidInit;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_VoidInit
DIO_VoidInit:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	$58, %eax
	movb	$-1, (%rax)
	movl	$55, %eax
	movb	$-1, (%rax)
	movl	$52, %eax
	movb	$0, (%rax)
	movl	$49, %eax
	movb	$0, (%rax)
	movl	$59, %eax
	movzbl	(%rax), %eax
	movl	$59, %eax
	movb	$-1, (%rax)
	movl	$56, %eax
	movzbl	(%rax), %eax
	movl	$56, %eax
	movb	$15, (%rax)
	movl	$53, %eax
	movl	$53, %edx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movl	$50, %eax
	movl	$50, %edx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8ReadPinVal
	.def	DIO_u8ReadPinVal;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8ReadPinVal
DIO_u8ReadPinVal:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movq	%rdx, 24(%rbp)
	movb	%al, 16(%rbp)
	cmpb	$31, 16(%rbp)
	ja	.L3
	movzbl	16(%rbp), %eax
	shrb	$3, %al
	movb	%al, -2(%rbp)
	movzbl	16(%rbp), %eax
	andl	$7, %eax
	movb	%al, -3(%rbp)
	movzbl	-2(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrPIN(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movzbl	-3(%rbp), %eax
	movl	$1, %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	movl	%r8d, %eax
	andl	%eax, %edx
	movzbl	-3(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movb	%dl, (%rax)
	movb	$1, -1(%rbp)
	jmp	.L4
.L3:
	movb	$0, -1(%rbp)
.L4:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8WritePinVal
	.def	DIO_u8WritePinVal;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8WritePinVal
DIO_u8WritePinVal:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%edx, %eax
	movb	%cl, 16(%rbp)
	movb	%al, 24(%rbp)
	cmpb	$31, 16(%rbp)
	ja	.L7
	movzbl	16(%rbp), %eax
	shrb	$3, %al
	movb	%al, -2(%rbp)
	movzbl	16(%rbp), %eax
	andl	$7, %eax
	movb	%al, -3(%rbp)
	cmpb	$0, 24(%rbp)
	jne	.L8
	movzbl	-2(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrPORT(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	-2(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	DIO_u8ArrPORT(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	movzbl	(%rdx), %edx
	movl	%edx, %r8d
	movzbl	-3(%rbp), %edx
	movl	$1, %r9d
	movl	%edx, %ecx
	sall	%cl, %r9d
	movl	%r9d, %edx
	notl	%edx
	andl	%r8d, %edx
	movb	%dl, (%rax)
	jmp	.L9
.L8:
	movzbl	-2(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrPORT(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	-2(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	DIO_u8ArrPORT(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	movzbl	(%rdx), %edx
	movl	%edx, %r8d
	movzbl	-3(%rbp), %edx
	movl	$1, %r9d
	movl	%edx, %ecx
	sall	%cl, %r9d
	movl	%r9d, %edx
	orl	%r8d, %edx
	movb	%dl, (%rax)
.L9:
	movb	$1, -1(%rbp)
	jmp	.L10
.L7:
	movb	$0, -1(%rbp)
.L10:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8ReadPortVal
	.def	DIO_u8ReadPortVal;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8ReadPortVal
DIO_u8ReadPortVal:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movq	%rdx, 24(%rbp)
	movb	%al, 16(%rbp)
	cmpb	$3, 16(%rbp)
	ja	.L13
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrPIN(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	(%rax), %edx
	movq	24(%rbp), %rax
	movb	%dl, (%rax)
	movb	$1, -1(%rbp)
	jmp	.L14
.L13:
	movb	$0, -1(%rbp)
.L14:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8WritePortVal
	.def	DIO_u8WritePortVal;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8WritePortVal
DIO_u8WritePortVal:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movq	%rdx, 24(%rbp)
	movb	%al, 16(%rbp)
	cmpb	$3, 16(%rbp)
	ja	.L17
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrPORT(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	24(%rbp), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movb	$1, -1(%rbp)
	jmp	.L18
.L17:
	movb	$0, -1(%rbp)
.L18:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8WritePinDir
	.def	DIO_u8WritePinDir;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8WritePinDir
DIO_u8WritePinDir:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%edx, %eax
	movb	%cl, 16(%rbp)
	movb	%al, 24(%rbp)
	cmpb	$31, 16(%rbp)
	ja	.L21
	movzbl	16(%rbp), %eax
	shrb	$3, %al
	movb	%al, -2(%rbp)
	movzbl	16(%rbp), %eax
	andl	$7, %eax
	movb	%al, -3(%rbp)
	movzbl	-2(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrDDR(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	-2(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	DIO_u8ArrDDR(%rip), %rdx
	movq	(%rcx,%rdx), %rdx
	movzbl	(%rdx), %edx
	movl	%edx, %r8d
	movzbl	-3(%rbp), %edx
	movl	$1, %r9d
	movl	%edx, %ecx
	sall	%cl, %r9d
	movl	%r9d, %edx
	notl	%edx
	andl	%edx, %r8d
	movl	%r8d, %r9d
	movzbl	24(%rbp), %r8d
	movzbl	-3(%rbp), %edx
	movl	%edx, %ecx
	sall	%cl, %r8d
	movl	%r8d, %edx
	orl	%r9d, %edx
	movb	%dl, (%rax)
	jmp	.L22
.L21:
	movb	$0, -1(%rbp)
.L22:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8WritePortDir
	.def	DIO_u8WritePortDir;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8WritePortDir
DIO_u8WritePortDir:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%edx, %eax
	movb	%cl, 16(%rbp)
	movb	%al, 24(%rbp)
	cmpb	$3, 16(%rbp)
	ja	.L25
	movzbl	16(%rbp), %eax
	shrb	$3, %al
	movb	%al, -2(%rbp)
	movzbl	-2(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrDDR(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	24(%rbp), %edx
	movb	%dl, (%rax)
	jmp	.L26
.L25:
	movb	$0, -1(%rbp)
.L26:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8ReadPinDir
	.def	DIO_u8ReadPinDir;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8ReadPinDir
DIO_u8ReadPinDir:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movq	%rdx, 24(%rbp)
	movb	%al, 16(%rbp)
	cmpb	$31, 16(%rbp)
	ja	.L29
	movzbl	16(%rbp), %eax
	shrb	$3, %al
	movb	%al, -2(%rbp)
	movzbl	16(%rbp), %eax
	andl	$7, %eax
	movb	%al, -3(%rbp)
	movzbl	-2(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrDDR(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movzbl	-2(%rbp), %eax
	movl	$1, %r8d
	movl	%eax, %ecx
	sall	%cl, %r8d
	movl	%r8d, %eax
	andl	%eax, %edx
	movzbl	-2(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movq	24(%rbp), %rax
	movb	%dl, (%rax)
	jmp	.L30
.L29:
	movb	$0, -1(%rbp)
.L30:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	DIO_u8ReadPortDir
	.def	DIO_u8ReadPortDir;	.scl	2;	.type	32;	.endef
	.seh_proc	DIO_u8ReadPortDir
DIO_u8ReadPortDir:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movq	%rdx, 24(%rbp)
	movb	%al, 16(%rbp)
	cmpb	$3, 16(%rbp)
	ja	.L33
	movzbl	16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	DIO_u8ArrDDR(%rip), %rax
	movq	(%rdx,%rax), %rax
	movzbl	(%rax), %edx
	movq	24(%rbp), %rax
	movb	%dl, (%rax)
	movb	$1, -1(%rbp)
	jmp	.L34
.L33:
	movb	$0, -1(%rbp)
.L34:
	movzbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 4.8.2"
