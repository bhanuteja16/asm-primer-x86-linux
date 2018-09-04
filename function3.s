.data

	HelloWorld:
		.asciz "Hello World!\n"

.text

	.globl _start
	.type PrintFunction, @function

	PrintFunction:
		pushl %ebp # Strore the current value of ebp in stack 
		movl %esp, %ebp # Make ebp point to top of stack 

		# The Write function

		movl $4, %eax
		movl $1, %ebx
		movl 8(%ebp), %ecx
		movl 12(%ebp), %edx
		int $0x80

		movl %ebp, %esp # restore old value of ESP
		popl %ebp #Restore the old value of EBP
		ret # change EIP to start the next instruction

	_start:

		nop
		# push the strlen on the stack 
		pushl $13

		pushl $HelloWorld

		# Call the function
		call PrintFunction		

		# adjust the stack pointer 
		addl $8, %esp

		#Exit call

		movl $1, %eax
		movl $0, %ebx
		int $0x80
