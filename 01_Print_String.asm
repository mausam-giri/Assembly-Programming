.model small
.stack 100h

.data
    string DB "Mausam Giri", "$"
    
.code
    start:
        MOV AX, @data
        MOV DS, AX
        
        MOV AH, 09H
        INT 21H
        
        MOV AX, 4CH
        INT 21H
    end start