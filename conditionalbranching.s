.data

	HelloWorld:
		.asciz "Hello World!\n"

	ZeroFlagSet:
		.asciz "Zero Flag was Set!"

	ZeroFlagNotSet:
		.asciz "Zero Flag Not Set!"

.text

	.globl _start

	_start:

		nop
		movl $10, %eax
		movl $10, %ebx
		xorl %eax, %ebx
		jz FlagSetPrint  # try jnz here 

	FlagNotSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagNotSet, %ecx
		movl $19, %edx
		int $0x80
		jmp ExitCall

	FlagSetPrint:
		movl $4, %eax
		movl $1, %ebx
		movl $ZeroFlagSet, %ecx
		movl $19, %edx
		int $0x80
		jmp PrintLoop

	ExitCall:
		movl $1, %eax
		movl $7, %ebx
		int $0x80

	PrintLoop:
		movl $10, %ecx
		LoopThis:
			pushl %ecx # push the value to stack , so that ecx can be used to print
			movl $4, %eax
			movl $1, %ebx
			movl $HelloWorld, %ecx
			movl $14, %edx
			int $0x80
			popl %ecx # get value from stack to ecx
		loop LoopThis
		jmp ExitCall
