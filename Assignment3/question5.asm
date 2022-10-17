main:
    # Enter String Prompt
	li $v0, 4
	la $a0, enter_string_prompt
	syscall
	
    # Read String
	li $v0, 8
	la $a0, user_string
	li $a1, 64
	syscall
		
	# Conver String to Char Array
	la $a1, char_array
	jal convert_to_char_array
	# Set a0 to the start of the char array | Start of the string
	addi $a0, $a1, 0
	
	# Set a1 to the end of the char array | End of the string
	jal get_array_length
	addi $a1, $v0, 0 # a1 = string length
	
    # Interchange a0 and a1
    li $t0, 0
    li $t1, 0
	la $a0, char_array
	addi $t0, $a0, 0
	addi $a0, $a1, 0
	addi $a1, $t0, 0
	addi $t0, $zero, 0
		
	# Call the function to check if the string is a palindrome
	jal is_palindrome__body
	beq $v0, 0, main__not_palindrome

    # Palindrome Confirm :)
    li $v0, 4
    la $a0, confirm_palindrome
    syscall

    # Return Statement
    li $v0, 10
    syscall

main__not_palindrome:
    # Not a Palindrom :(
    li $v0, 4
    la $a0, not_palindrome
    syscall

    # Return Statement
    li $v0, 10
    syscall
	
convert_to_char_array:
    add $s0, $a0, $zero # pointer to string
    add $s1, $a1, $zero # pointer to char array
    add $s2, $a0, 52

convert_to_char_array__loop:
    lb $s4, ($s0)
    sw $s4, ($s1)

    addi $s0, $s0, 1 # increment pointer
    addi $s1, $s1, 4 # increment array pointer
    
    bne $s0, $s2, convert_to_char_array__loop

convert_to_char_array__epilogue:
    jr $ra  
    
get_array_length:
	lb $s2, string_end # load the end of string character
	add $t5, $zero, $zero # Length = 0

get_array_length__loop:
	lb $s1, 0($a0)
	beq $s1, $s2, get_array_length__epilogue
	addi $t5, $t5, 1
	addi $a0, $a0, 1
	bne $a0, $s2, get_array_length__loop

get_array_length__epilogue:
	add $v0, $t5, $zero
	jr $ra
	

is_palindrome__body:
    slti $s1, $a0, 8 # if only one char is left
    beq $s1, 1, is_palindrome__body__if_true

    add $s2, $a1, $zero
    add $s3, $s2, $a0
    addi $s3, $s3, -4

    lw $s4, 0($s2)
    lw $s5, 0($s3)

    bne $s4, $s5, is_palindrome__body__if_false

is_palindrome__loop:
    addi $a0, $a0, -8
    slti $s1, $a0, 8 # if only one char is left
    beq $s1, 1, is_palindrome__body__if_true

    # start += 1 | end -= 1
    addi $s2, $s2, 4
    addi $s3, $s3, -4

    lw $s4, 0($s2)
    lw $s5, 0($s3)

    beq $s4, $s5, is_palindrome__loop

is_palindrome__body__if_false:
    li $v0, 0
    jr $ra

is_palindrome__body__if_true:
    li $v0, 1
    jr $ra

.data

user_string: .space 52
char_array: .space 208

enter_string_prompt: .asciiz "Enter a string: "
string_end: .asciiz "\n"
confirm_palindrome: .asciiz "Yes, the string is a palindrome.\n"
not_palindrome: .asciiz "No, the string is not a palindrome.\n"
notEqualMsg: .asciiz "Outputs for loop and recursive versions are not equal"
