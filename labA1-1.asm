; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
TITLE labA1-1.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
	HappyFace DB 1   ; ☺ symbol (01h)
.CODE
	MOV AX, @DATA 	
    MOV DS, AX
    MOV ES, AX

    MOV AX, 0600h    ; AH=00h (Scroll), AL=00h (Full Screen)
    MOV BH, 07h      ; 0 (Black background), 7 (White Text Color)
    MOV CX, 0000h    ; CH=00h (Row), CL=00h (Column)
    MOV DX, 184Fh    ; DH=18h (Row), DL=4Fh (Column)
    INT 10h          ; call interrupt service

    MOV AH, 13h      ; request display string with attributes
    MOV AL, 00h      ; do not advance cursor
    MOV BH, 00h      ; page number 0
    MOV BL, 0C6h	 ; Blink + Red background (dark red) + Yellow text
    MOV BP, OFFSET HappyFace
    MOV CX, 1        ; length of string
    MOV DH, 0Ch      ; row 12 in decimal
    MOV DL, 27h      ; column 39 in decimal
    INT 10h          

    MOV AX, 4C00h
    INT 21h
END