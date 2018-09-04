.data

	HelloWorld:
		.asciz "Hello World!"

	CallDemo:
		.asciz "Call works!"

.text

	.globl _start
	
	_start:

		nop

		# Call CallMe, it gets added to the stack 
		call CallMe

		# Bypass Hello world and jump to exit 
		jmp ExitProgram

		# Write HelloWorld
		movl $4, %eax
		movl $1, %ebx
		movl $HelloWorld, %ecx
		movl $12, %edx
		int $0x80


	ExitProgram:

		# Exit the Program

		movl $1, %eax
		movl $10, %ebx
		int $0x80


	CallMe:
		
		# Write Call works

		movl $4, %eax
		movl $1, %ebx
		movl $CallDemo, %ecx
		movl $11, %edx
		int $0x80
		ret
