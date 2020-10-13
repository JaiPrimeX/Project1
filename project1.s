.data
      inputMessage:  .asciiz "Input: "
      outputMessage: .asciiz "Output: "
      newLine:       .asciiz "\n"
      userInput:     .space  11 
.text
     main:
          #Displaying Input
          la $a0, inputMessage
          li $v0, 4
          syscall
          #Getting user's input as text
          li $v0, 8
          la $a0, userInput
          li $a1, 11
          syscall
          #Inserting NewLine Before Output Display
          la $a0,newLine
          li $v0,4
          syscall
          
          #Initializing Values Before Loop
          add $s0, $zero, $zero            #The Value that will be incremented
          addi $s1, $zero, 10              #Closing condition for loop
          add $t0, $zero, $zero            #Initializing Output Value Register
          addi $t2, $zero, 1               #Register with Value 1 for Comparison
          addi $s2, $zero, 65              #Lower limit of UppercaseHandler
          addi $s3, $zero, 86              #Upper limit of UppercaseHandler
          addi $s4, $zero, 97              #Lower limit of LowercaseHandler
          addi $s5, $zero, 118             #Upper limit of LowercaseHandler
          addi $s7, $zero, 58              #Upper limit of Handlerof1to9
          addi $t5, $zero, 49              #Lower limit of Handlerof1to9

          Loop:
                lb $s6, userInput($s0)
                slt $t1, $s6, $s7
                beq $t1, $t2, Handlerof1to9
                j UppercaseHandler
          Return_here:   
                addi $s0, $s0, 1
                bne $s0, $s1, Loop
                j Exit
          Handlerof1to9:
                slt $t1, $s6, $t5
                beq $t1, $t2, AnythingElseHandler
                addi $s6, $s6, -48
                add $t0, $t0, $s6
                j Return_here
          UppercaseHandler:
                slt $t1, $s6, $s2
                beq $t1, $t2, AnythingElseHandler
                slt $t1, $s6, $s3
                beq $t1, $zero, LowercaseHandler
                addi $s6, $s6, -55
                add $t0, $t0, $s6
                j Return_here
          LowercaseHandler:
                slt $t1, $s6, $s4
                beq $t1, $t2, AnythingElseHandler
                slt $t1, $s6, $s5
                beq $t1, $zero, AnythingElseHandler
                addi $s6, $s6, -87
                add $t0, $t0, $s6
                j Return_here
          AnythingElseHandler:
                add $s6, $zero, $zero
                add $t0, $t0, $s6
                j Return_here
       Exit:
          #Displaying Output
          la $a0, outputMessage
          li $v0, 4
          syscall
          #Print out Output aka $t0
          move $a0, $t0
          li $v0, 1
          syscall   
          #End of main
          li $v0, 10
          syscall