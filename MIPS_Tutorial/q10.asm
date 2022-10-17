.data 
.text
	addi $sp, $sp, -12
	
	sw $t1, 8($sp)
	sw $t0, 4($sp)
	sw $s0, 0($sp)
	
	li $v0, 1
	add $a0, $zero, $sp
	syscall
