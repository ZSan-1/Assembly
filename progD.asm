; Zack Torraye C. Santos BSCS - 3B ITC 129 1:30PM-6:30PM
TITLE progD.asm		;Name of the program
DOSSEG				
.MODEL SMALL			
.STACK 0100h			
.DATA				
.CODE				
	MOV AX, @DATA 	
	MOV DS, AX		
	MOV CX, 001Eh 	;Loop Counter set to 30
	MOV AH, 02h		;Request display character
	MOV DL, 'z'		;Character to display
	A: INT 21h		;Call interrupt service
	LOOP A			;Go to label A

	MOV AX, 4C00h	;End
	INT 21h
END