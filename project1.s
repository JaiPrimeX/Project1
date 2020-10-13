.data
      userInput: .space  11 
.text
     main:
          #Getting user's input as text
          li $v0, 8
          la $a0, userInput
          li $a1, 11
          syscall
          
          #Initializing Values Before Loop
          add $s0, $zero, $zero            #The Value that will be incremented
          addi $s1, $zero, 10              #Closing condition for loop
          add $t0, $zero, $zero            #Initializing Output Value Register
          

          Loop:
               lb $s6, userInput($s0)
          Return_here:   
               addi $s0, $s0, 1
               bne $s0, $s1, Loop
               j Exit
          1to9Handler:
          
          UppercaseHandler:
          
          LowercaseHandler:

          AnythingElseHandler:

       Exit:   
          #End of main
          li $v0, 10
          syscall