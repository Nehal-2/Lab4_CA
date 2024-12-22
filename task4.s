.text
main:
    li a2, 5 # a = 5
    li a3, 6 # b = 6
    li a5, 0 # result = 0
loop_start:
    bge x0, a3, exit # while (b > 0), exit if b <= 0
    andi t0, a3, 1 # b & 1
    beq x0, t0, skip_add # skip if (b & 1) == 0
    add a5, a5, a2 # result += a
skip_add:
    slli a2, a2, 1 # a <<= 1 Double the value of a (equivalent to a = a * 2)
    srli a3, a3, 1 # b >>= 1 Halve the value of b (equivalent to b = b / 2)
    jal ra, loop_start
exit:
    mv a1, a5 # mv the value to be printed (result) into a1
    li a0, 1 # for printing an integer
    ecall
    li a0, 10 
    ecall