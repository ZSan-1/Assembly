; Zack Torraye C. Santos BSCS - 3B ITC 129 1:30PM-6:30PM
TITLE progB.asm			;Name of the program
DOSSEG				
.MODEL SMALL			
.STACK 0100h			
.DATA				
.CODE				
	MOV AX, @DATA 	
	MOV DS, AX		
	
	MOV AH, 02h		;Request display character
	MOV DL, 'A'		;Character to display
	INT 21h			;Call interrupt service

	MOV AX, 4C00h		;END OF THE PROGRAM
	INT 21h
END