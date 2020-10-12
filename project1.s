.data
      userInput: .space  10 
.text
     main:
          #Getting user's input as text
          li $v0, 8
          la $a0, userInput
          li $a1, 10
          syscall
     
 

     #End of main
     li $v0, 10
     syscall