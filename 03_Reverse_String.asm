ORG 100h

.DATA
    message DB 'ABCD', '$'
    
.CODE
    start:
        MOV AX, @DATA
        MOV DS, AX
        
        LEA SI, message
        MOV CX, 0
        
        process:
            MOV AL, [SI]
            CMP AL, '$'
            JE reverse
            
            INC SI
            INC CL
            
            JMP process
        
        reverse:
            DEC SI
            print:
                MOV AL, [SI]
                MOV AH, 0EH
                INT 10H
                DEC SI 
                
                DEC CL
                JNZ print
        done:   
            RET
     end start
        
                