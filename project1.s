.data
      userInput: .space  11 
.text
     main:
          #Getting user's input as text
          li $v0, 8
          la $a0, userInput
          li $a1, 11
          syscall
          
          add $s2, $zero, $zero
          addi $s3, $zero, 11
          Loop:
               la $a1, userInput
               addu $a1, $a1, $s2
               lbu $a0,($a1)

          

     #End of main
     li $v0, 10
     syscall