.data
rows: .word 5
asterisk: .byte 42 # ASCII for *
space: .byte 32 # ASCII for [space]
newline: .byte 10 # ASCII for [line feed]

.text
main:
    lw t0, rows # Number of rows
    li t1, 1 # Initialization of loop variable i
    
loop_start:
    blt t0, t1, exit # Execute for i <= rows, else exit 
    
    sub t2, t0, t1 # t2 = rows - i (number of spaces)
    li t3, 1 # Initialization of loop variable 'space'
loop_spaces:
    blt t2, t3, loop_asterisks # Execute for space <= rows - i
    lb a1, space # Print spaces
    li a0, 11 # ID for printing a character
    ecall
    addi t3, t3, 1 # Increment 'space'
    j loop_spaces
loop_asterisks:
    li t3, 1
    slli t4, t1, 1 # t4 = (2 * i)
    addi t4, t4, -1 # t4 = (2 * i) - 1 (number of asterisks)
print_asterisks:
    blt t4, t3, loop_newline
    lb a1, asterisk # Print asterisks
    li a0, 11 # ID for printing a character
    ecall
    addi t3, t3, 1
    j print_asterisks
loop_newline:
    lb a1, newline # Print a new line
    li a0, 11 # ID for printing a character
    ecall
    addi t1, t1, 1
    j loop_start
exit:
    li a0, 10 
    ecall
