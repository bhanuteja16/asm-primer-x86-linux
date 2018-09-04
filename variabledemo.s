# Demo to show different data types and MOVx instructions

.data
	
	HelloWorld:
		.ascii "Hello World!"

	ByteLocation:
		.byte 10

	Int32:
		.int 2

	int16:
		.short 3

	Float:
		.float 12.56

	IntegerArray:
		.int 11,12,13,14,15


.bss

	.comm LargBuffer, 10000

.text

	.globl _start

	_start:
		nop
		# Just exit this program
		movl $1, %eax
		movl $0, %ebx
		int $0x80
