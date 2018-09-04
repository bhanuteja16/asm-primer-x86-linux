.data
	HelloWorldString:
		.asciz "Hello World of Assembly!"
	H3110:
		.asciz "H3110"

.bss
	.lcomm Destination, 100
	.lcomm DestinationUsingRep, 100
	.lcomm DestinationUsingstos, 100

.text
	.globl _start

	_start:
		# 1. Simple Copying using movsb, movsw and movsl

		movl $HelloWorldString, %esi
		movl $Destination, %edi

		movsb
		movsw
		movsl

		# 2. setting / clearing the DF flag

		std # set the DF flag
		cld # clear the DF flag

		# 3. Using Rep

		movl $HelloWorldString, %esi
		movl $DestinationUsingRep, %edi
		movl $25, %ecx #set the string length in ECX
		cld # Clear the DF
		rep movsb
		std

		# 4. Loading String from memory into EAX register

		cld
		leal HelloWorldString, %esi
		lodsb
		movb $0, %al

		dec %esi
		lodsw
		movw $0, %ax

		subl $2, %esi # Make ESI point back to the orignal string
		lodsl

		# 5. Storing strings from EAX to memory

		leal DestinationUsingstos, %edi
		stosb
		stosw
		stosl

		# 6. Comparing Strings 

		cld
		leal HelloWorldString, %esi
		leal H3110, %edi
		cmpsb

		dec %esi
		dec %edi
		cmpsw

		subl $2, %esi
		subl $2, %edi
		cmpsl

		# The exit() routine

		movl $1, %eax
		movl $10, %ebx
		int $0x80
