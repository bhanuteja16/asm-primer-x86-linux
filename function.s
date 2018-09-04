.data

	HelloWorld:
		.asciz "Hello World!\n"

	HelloFunction:
		.asciz "Hello function!\n"

.text

	.globl _start

	.type MyFuction, @function

		MyFunction: # string poniter and len to be added by passing arguments
			movl $4, %eax
			movl $1, %ebx
			int $0x80
			ret

	_start :
		nop
		# Print the Hello World string

		movl $HelloWorld, %ecx
		movl $14, %edx
		call MyFunction

		# Print HelloFunction

		leal HelloFunction, %ecx
		movl $17, %edx
		call MyFunction

	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80
