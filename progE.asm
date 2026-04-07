; Zack Torraye C. Santos BSCS - 3B ITC 129 1:30PM-6:30PM
TITLE progE.asm		;Name of the program
DOSSEG				
.MODEL SMALL			
.STACK 0100h			
.DATA				
.CODE				
	MOV AX, @DATA 	
	MOV DS, AX		
	MOV CX, 001Eh 	;Loop Counter set to 30k
	MOV AH, 02h		;Request display character
	MOV DL, 'A'		;Character to display
	B: INT 21h		;Call interrupt service
	INC DL			;Add 1 to the value of DL
	LOOP B			;Go to label B

	MOV AX, 4C00h	;End
	INT 21h
END