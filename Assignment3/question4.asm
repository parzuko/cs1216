main:

main_prologue:
	addi $sp, $sp, -16
	sw $ra, 12($sp)
    sw $s0, 8($sp)
    sw $s1, 4($sp)
	sw $s2, 0($sp)
	
main__body:
	li	$v0, 4        # syscall 4: print_string
	la	$a0, enter_n_prompt
	syscall  
	
	li   $v0, 5       # scanf("%d", n);
    syscall
	move $s0, $v0      # s0 = n
  
main__if:
	bgt $s0, 0, main__else 
	li	$v0, 4   
	la	$a0, invalid_input
	syscall 

    li	$v0, 11       
	li	$a0, '\n'
	syscall 

    li $v0, 10
    syscall
	
main__else:
	move $a0, $s0
	jal naive_square__prologue
	move $s1, $v0         # s1 = naive
	
	move $a0, $s0
	jal interesting_square__prologue
	move $s2, $v0         # s2 = interesting
	
	li	$v0, 4        # syscall 4: print_string
	la	$a0, naive_string
	syscall 
	
	li	$v0, 1              # syscall 1: print_int
	move $a0, $s1
	syscall  
	
	li	$v0, 11             # syscall 11: print_char
	li	$a0, '\n'
	syscall   
	
	li	$v0, 4        # syscall 4: print_string
	la	$a0, interesting_string
	syscall 
	
	li	$v0, 1              # syscall 1: print_int
	move $a0, $s2
	syscall 

    li	$v0, 11             # syscall 11: print_char
	li	$a0, '\n'
	syscall  
	
main__epilogue:

	lw $s2, 0($sp)
    lw $s1, 4($sp)
    lw $s0, 8($sp)
    lw $ra, 12($sp)
    addi $sp, $sp, 16
    	
	li $v0, 10 # equivalent of jr $ra in MARS
	syscall
	
naive_square__prologue:
	addi $sp, $sp, -20
	sw $ra, 16($sp)
	sw $s0, 12($sp)
    sw $s1, 8($sp)
    sw $s2, 4($sp)
    sw $s3, 0($sp)
	
naive_square:
	move $s0, $a0       #s0 = n
	li $s1, 0       # s1 = sum = 0
	li $s2, 1       #s2 = i = 1
naive_square__loop:
	bgt $s2, $s0, naive_square__epilogue
	
	move $s3, $s2
	mul $s3, $s3, $s3	# sum = sum +  (int) pow(i, 2);
	add $s1, $s1, $s3
	addi $s2, $s2, 1       # i++

	j naive_square__loop

naive_square__epilogue:
	move $v0, $s1
	
	lw $s3, 0($sp)
	lw $s2, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
	
interesting_square__prologue:
	addi $sp, $sp, -20
	sw $ra, 16($sp)
	sw $s0, 12($sp)
	sw $s2, 8($sp)
	sw $s3, 4($sp)
	sw $s4, 0($sp)

interesting_square:
    move $s0, $a0       #s0 = n

    addi $s2, $s0, 1        # s2 = n + 1
    mul  $s3, $s0, $s2      # s3 = n * (n + 1) 
    add  $s4, $s0, $s0      # s4 = 2*n
    addi $s4, $s4, 1        # s4 = 2*n + 1
    mul  $s3, $s3, $s4      # s3 = n * (n + 1) * (2*n + 1)
    div  $s3, $s3, 6         # s3 = n * (n + 1) * (2*n + 1) / 6

	move $v0, $s3

interesting_square__epilogue:	
	lw $s4, 0($sp)
	lw $s3, 4($sp)
	lw $s2, 8($sp)
	lw $s0, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
	
.data

enter_n_prompt:   .asciiz "Enter n: "
invalid_input:  .asciiz "Invalid input n cannot be negative!\t"
naive_string:   .asciiz "Naive: "
interesting_string:   .asciiz "Interesting: "
