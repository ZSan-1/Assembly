; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
TITLE labA1-2.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
    str1 DB "zacktorraye@gmail.com"
    str2 DB "ARELLANO UNIVERSITY - JUAN SUMULONG CAMPUS"
    str3 DB "LEGARDA, MANILA"
.CODE
    MOV AX, @DATA     
    MOV DS, AX
    MOV ES, AX

    ; Clear screen
    MOV AX, 0600h    
    MOV BH, 07h      
    MOV CX, 0000h    
    MOV DX, 184Fh    
    INT 10h          

    ; ===== Print Email (Blink) =====
    MOV AH, 13h          ; Write string w/ attribute
    MOV AL, 0            ; Don’t update cursor
    MOV BH, 0            ; Page 0
    MOV BL, 0A1h         ; Attribute: Blink + Red BG + Yellow text
    MOV CX, 20           ; String length (# of characters)
    MOV DH, 0Ch          ; Row 12
    MOV DL, 20h          ; Col 32
    MOV BP, OFFSET str1
    INT 10h

    ; ===== Print University (Blink) =====
    MOV AH, 13h
    MOV AL, 0
    MOV BH, 0
    MOV BL, 0A1h         ; Blink attribute
    MOV CX, 43           ; Length of string
    MOV DH, 0Dh          ; Row 13
    MOV DL, 15h          ; Col 21
    MOV BP, OFFSET str2
    INT 10h

    ; ===== Print Address (Blink) =====
    MOV AH, 13h
    MOV AL, 0
    MOV BH, 0
    MOV BL, 0A1h         ; Blink attribute
    MOV CX, 14           ; Length of string
    MOV DH, 0Eh          ; Row 14
    MOV DL, 22h          ; Col 34
    MOV BP, OFFSET str3
    INT 10h

    ; Exit
    MOV AX, 4C00h
    INT 21h
END
