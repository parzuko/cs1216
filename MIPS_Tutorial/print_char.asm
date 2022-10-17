.data
	myChar: .byte 'j'
.text
	li $v0, 4
	la $a0, myChar
	syscall