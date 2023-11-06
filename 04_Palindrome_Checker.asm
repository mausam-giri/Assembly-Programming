.MODEL small
.STACK 100h

DATA SEGMENT
    string      DB  'MALAYALAM', '$'
    found       DB  'Palindrome', '$'
    notFound    DB  'Not Palindrome', '$'
DATA ENDS

CODE SEGMENT
    
    main PROC
        MOV AX, @DATA
        MOV DS, AX
        
        CALL palindromeCheck
        
        MOV AH, 4CH
        INT 21H                
    main ENDP
       
    palindromeCheck PROC
        LEA SI, string
        count:
            MOV AL, [SI]
            CMP AL, '$'
            JE next
            
            INC SI
            JMP count
            
        next:
            LEA DI, string
            DEC SI
        compare:
            CMP SI, DI
            JL match
            
            MOV AL, [SI]
            MOV BL, [DI]
            CMP AL, BL
            JNE notMatch
            
            DEC SI
            INC DI
            JMP compare
        match:
            LEA DX, found
            CALL printString
            RET
        notMatch:
            LEA DX, found
            CALL printString
            RET
    palindromeCheck ENDP
      
    printString PROC
        MOV AH, 09H
        INT 21H
        RET
    printString ENDP
    
CODE ENDS
END
            
        