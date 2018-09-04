#String compare

.data
HelloWorldString:
	.asciz "Hello World of String"
HelloWorldAssembly:
	.asciz "Hello World of Assembly"
Notsame:
	.asciz "Strings are not same"

.text

.globl _start

_start:
	# Compare the strings
	
	movl $HelloWorldAssembly, %esi
	movl $HelloWorldString, %edi
	movl $30, %ecx
	repz cmpsb

	#exit the program
	movl $1, %eax
	movl $0, %ebx
	int $0x80
