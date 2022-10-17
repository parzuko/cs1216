.data

.text 
	add $s1, $zero, 16
	add $s2, $zero, 15
	add $s3, $zero, 20
	add $s4, $zero, 24
	
	lw $s3, 0($s1)
	
	# print integer
	move $a0, $s3
	li $v0, 1
	syscall
	