.data 
start_address: .word 0x10000000

.text

main:
la t0 start_address
li t1, 0
li t2, 100


store_loop:
sw t1 0(t0)
addi t0 t0 4
addi t1 t1 1
li a0, 1 # (for printing)
addi a1, t1, 0  # (for printing)
ecall# (for printing)
blt t1 t2 store_loop

#load for validation
la t0 start_address
li t1, 0

load_loop:
sw t1 0(t0)
addi t0 t0 4
addi t1 t1 1
blt t1 t2 load_loop


end:
li a0, 10  
ecall
