"""
Convert the following fragment of C code into MIPS assembly.  Assume the only instructions available for you to use are add, addi, sub, lw, sw, sll, srl, j, beq and bne. Also assume that variables i and j are stored in $s2 and $s5, respectively.

if (i < j):
    j = j + (16 * i)
else:
    i = i - (64 * j)
"""

# Your code here
$addi $s2, $s2, 1