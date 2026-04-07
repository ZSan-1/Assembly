; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
TITLE pr16.asm		;TITLE OF THE PROGRAM
DOSSEG				;START OF DOS SEGMENT
.MODEL SMALL		;MODEL OF THE PROGRAM
.STACK 0100h		;SIZE OF THE PROGRAM
.DATA				;DATA SEGMENT
	msg DB "Hello$"
.CODE				;CODE SEGMENT
	MOV AX, @DATA	;READING/LOADING THE DATA SEGMENT
	MOV DS, AX		;LOAD THE DATE OF THE DS REGISTER (DATA)

	MOV AX, 0600h	;request for clear screen
	MOV BH, 07h		;0 - black bg, 7 - white tc
	MOV CX, 0000h	;no. of char/screen
	MOV DX, 184Fh	;MAX row = 18h, MAX COL = 4Fh
	INT 10h			;INTERRUPT SERVICE for clear screen

	MOV AH, 02h     ;request setting cursor position
	MOV BH, 0000h   ;page number 0
	MOV DH, 0Ch     ;ROW = 12 in DEC
	MOV DL, 25h     ;COL = 37 in DEC
	INT 10h         ;INTERRUPT SERVICE for setting cursor position

	MOV Ah, 09h
	MOV DX, OFFSET msg ;string data
	INT 21h

	MOV AX, 4C00h	;END 
	INT 21h
END