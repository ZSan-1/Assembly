; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
TITLE pr10.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
	str1 db "Uppercase Letters: $"
	str2 db "Lowercase Letters: $"
	str3 db "Numbers: $"
	str4 db "Special Characters: $"
.CODE
	MOV AX, @DATA
	MOV DS, AX

	MOV AH, 09h
	MOV DX, OFFSET str1
	INT 21h

	MOV AH, 02h
	MOV CX, 1Ah
	MOV DL, 41h
	A: INT 21h
	INC DL
	LOOP A

	MOV BL, DL
	MOV DL, 0Ah
	INT 21h

	MOV DL, 0Dh
	INT 21h

	MOV AH, 09h
	MOV DX, OFFSET str2
	INT 21h

	MOV AH, 02h
	MOV CX, 1Ah
	MOV DL, 61h
	B: INT 21h
	INC DL
	LOOP B

	MOV BL, DL
	MOV DL, 0Ah
	INT 21h

	MOV DL, 0Dh
	INT 21h

	MOV AH, 09h
	MOV DX, OFFSET str3
	INT 21h

	MOV AH, 02h
	MOV CX, 0Ah
	MOV DL, 30h
	C: INT 21h
	INC DL
	LOOP C

	MOV BL, DL
	MOV DL, 0Ah
	INT 21h

	MOV DL, 0Dh
	INT 21h

	MOV AH, 09h
	MOV DX, OFFSET str4
	INT 21h

	MOV AH, 02h
	MOV CX, 0Fh
	MOV DL, 21h
	D: INT 21h
	INC DL
	LOOP D

	MOV AH, 02h
	MOV CX, 07h
	MOV DL, 3Ah
	E: INT 21h
	INC DL
	LOOP E
	
	MOV Ah, 02h
	MOV CX, 06h
	MOV DL, 5Bh
	F: INT 21h
	INC DL
	LOOP F

	MOV Ah, 02h
	MOV CX, 04h
	MOV DL, 7Bh
	G: INT 21h
	INC DL
	LOOP G

	MOV AX, 4C00h
	INT 21h
END