TITLE prog8b.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
	str1 db "Arellano University", 0AH, 0DH, "$"
	str2 db "Computer Science$"
.CODE
	MOV AX, @DATA
	MOV DS, AX

	MOV AH, 09H
	MOV DX, OFFSET str1

	INT 21H
	MOV DX, OFFSET str2
	INT 21H
	
	MOV AX, 4C00h
	INT 21h
END
