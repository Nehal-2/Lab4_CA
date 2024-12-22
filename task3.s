.data 
vector1:    .byte 1, 2, 3, 4, 5, 6, 7, 8     
vector2:    .byte 9, 10, 11, 12, 13, 14, 15, 16  
result:     .word 0, 0, 0, 0, 0, 0, 0, 0

.text

main:
la t0 vector1
la t1, vector2
la t2 result

li t3 8
li t4 0

loop:
    lb t5, 0(t0)   
    lb t6, 0(t1)   
    add x5 t5, t6 
    sw x5, 0(t2)   

    li a0, 1 # (for printing)
    addi a1, t1, 0  # (for printing)
    ecall# (for printing)

    addi t0, t0, 1      
    addi t1, t1, 1      
    addi t2, t2, 4 
    addi t4, t4, 1      
    blt t4, t3, loop    


end:
li a0, 10  
ecall
