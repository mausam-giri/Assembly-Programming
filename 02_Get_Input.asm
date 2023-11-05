.model small
.stack 100h
 
.code
    start:
        MOV AH, 1H
        INT 21H
        
        MOV BL, AL
        MOV AH, 2H
        INT 21H
        
        MOV AH, 4CH
        INT 21H
    end start