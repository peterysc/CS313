.pos 0x100
	irmovl $bottom, %esp
	call  sum_function
	halt
sum_function:
	irmovl $aend, %esi
	irmovl $a, %edx
	xorl   %eax, %eax
L2:
	rrmovl %esi, %ebx
	subl   %edx, %ebx
	je     done
	mrmovl (%edx), %ebx
	addl   %ebx, %eax
	irmovl 0x4, %ebx
	addl   %ebx, %edx
	jmp    L2
done:	ret

.align 4
.pos 0x1000
a:	.long	4
	.long	7
	.long	8
	.long   3
	.long   61
	.long	9
	.long   41
	.long	12
	.long	11
	.long   15
aend: .long 0
	
#
# An example showing how to reserve space for a stack (this one
# can hold up to 16 (0x10) 32-bit addresses.
#
.pos 0x3000
top:	            .long 0x00000000,0x10     # top of stack.
bottom:             .long 0x00000000          # bottom of stack.