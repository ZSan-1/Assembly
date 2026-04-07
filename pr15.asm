; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
TITLE pr15.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
.CODE
	MOV AX, @DATA
	MOV DS, AX

	MOV AX, 0600h	;Clear the screen
	MOV BH, 07h
	MOV CX, 0000h
	MOV DX, 184Fh
	INT 10h

	MOV AH, 02h		;request for setting cursor
	MOV BH, 00h		;page number 0
	MOV DH, 0Ch 	;ROW = 12 in decimal
	MOV DL, 28h		;COL = 40 in decimal
	INT 10h

	MOV AH, 02h
	MOV DL, 41h
	INT 21h

	MOV AX, 4C00h
	INT 21h
END