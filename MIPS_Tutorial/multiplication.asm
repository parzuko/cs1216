.data

.text
	addi $s0, $zero, 10
	addi $s1, $zero, 4
	
	mul $t0, $s0, $s1 # Max Range 2 16 Bit Numbers
	
	mult $s0, $s1 # store in lo and hi 
	mflo $t2 # move from low to t2
	sll $s0, 2 # multipleis by 2^i
	
	
	# Display Product
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	
	