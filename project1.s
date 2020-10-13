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
          addi $t2, $zero, 1               #Register with Value 1 for Comparison
          addi $s2, $zero, 65              #Lower limit of UppercaseHandler
          addi $s3, $zero, 86              #Upper limit of UppercaseHandler

          Loop:
                lb $s6, userInput($s0)
          Return_here:   
                addi $s0, $s0, 1
                bne $s0, $s1, Loop
                j Exit
          1to9Handler:
          
          UppercaseHandler:
                slt $t1, $s6, $s2
                beq $t1, $t2, AnythingElseHandler
                slt $t1, $s6, $s3
                beq $t1, $zero, LowercaseHandler
                addi $s6, $s6, -55
                add $t0, $t0, $s6
                j Return_here
          
          LowercaseHandler:

          AnythingElseHandler:

       Exit:   
          #End of main
          li $v0, 10
          syscall