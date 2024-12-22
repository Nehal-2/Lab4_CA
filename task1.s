.data
equal_msg: 
    .asciiz "equal\n"     
    

notequal_msg:
    .asciiz "not equal\n"  
    


.text
    .globl _start
_start:

li x10 10 # int x = 0;
li x5 10 # int y = 0;

bne x5 x10 nequal 


equal:
    la a1, equal_msg    

li a0, 4            

ecall                
     j end               

nequal:
    la a1, notequal_msg 
    
    li a0, 4          
    
    ecall               
    
    


end:
    li a7, 10         
    
    ecall

