; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
TITLE labA1-2.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
    str1 DB "Zack Torraye C. Santos"
    len1 EQU ($-str1)

    str2 DB "BSCS - 3B"
    len2 EQU ($-str2)

    str3 DB "09919793655"
    len3 EQU ($-str3)

    str4 DB "zacktorraye@gmail.com"
    len4 EQU ($-str4)
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

    

    ;BORDER CORNER LEFT
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 0BH
    MOV DL, 0DH
    INT 10H
    MOV AH, 02H
    MOV DL, 0DAH
    INT 21H

    ;LINE SA GITNA
    MOV AH, 02H
    MOV CX, 34H
X:  MOV DL, 0C4H
    INT 21H
    LOOP X
    ;CORNER RIGHT
    MOV AH, 02H
    MOV DL, 0BFH
    INT 21H

    ;Line side LEFT
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 0CH ;ROW
    MOV DL, 0DH ;COL
    INT 10H
    MOV AH, 02H
    MOV CX, 04H
    MOV BL, 0CH
    Y:MOV AH, 02H
    MOV BH, 00H
    MOV DH, BL ;ROW
    MOV DL, 0DH ;COL
    INT 10H
    MOV AH, 02H
    MOV DL, 0B3H
    INT 21H
    INC BL
    LOOP Y
    ;END LINE LEFT

    ;Line side RIGHT
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 0CH ;ROW
    MOV DL, 42H ;COL
    INT 10H
    MOV AH, 02H
    MOV CX, 04H
    MOV BL, 0CH
    L:MOV AH, 02H
    MOV BH, 00H
    MOV DH, BL ;ROW
    MOV DL, 42H ;COL
    INT 10H
    MOV AH, 02H
    MOV DL, 0B3H
    INT 21H
    INC BL
    LOOP L
    ;END NG LINE SA RIGHT

    ;BORDER SA BABA LEFT
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 10H
    MOV DL, 0DH
    INT 10H

    MOV AH, 02H
    MOV DL, 0C0H
    INT 21H
    ;LINE sa GITNA
    MOV AH, 02H
    MOV CX, 34H
    Z:MOV DL, 0C4H
    INT 21H
    LOOP Z
    ;CORNER RIGHT SA BABA
    MOV AH, 02H
    MOV DL, 0D9H
    INT 21H

        ; ==================
    ; Inner Border (larger)
    ; ==================

    ; Top Left Corner
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 0Ah          ; higher (outer=0Bh → inner=0Ah)
    MOV DL, 0Ch          ; more left (outer=0Dh → inner=0Ch)
    INT 10h
    MOV AH, 02h
    MOV DL, 0DAh         ; ╔
    INT 21h

    ; Top Line
    MOV CX, 36h          ; wider than before
InnerTop:
    MOV DL, 0C4h
    INT 21h
    LOOP InnerTop
    MOV DL, 0BFh         ; ╗
    INT 21h

    ; Left Side
    MOV CX, 06h          ; taller
    MOV BL, 0Bh
InnerLeft:
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, BL
    MOV DL, 0Ch
    INT 10h
    MOV AH, 02h
    MOV DL, 0B3h         ; ║
    INT 21h
    INC BL
    LOOP InnerLeft

    ; Right Side
    MOV CX, 06h
    MOV BL, 0Bh
InnerRight:
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, BL
    MOV DL, 43h          ; shifted right
    INT 10h
    MOV AH, 02h
    MOV DL, 0B3h
    INT 21h
    INC BL
    LOOP InnerRight

    ; Bottom Line
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 11h          ; lower (outer=10h → inner=11h)
    MOV DL, 0Ch
    INT 10h
    MOV AH, 02h
    MOV DL, 0C0h         ; ╚
    INT 21h

    MOV CX, 36h
InnerBottom:
    MOV DL, 0C4h
    INT 21h
    LOOP InnerBottom
    MOV DL, 0D9h         ; ╝
    INT 21h


    ; ===== Print Name (Row 12) =====
    MOV AH, 13h          ; Write string
    MOV AL, 0            ; Don’t update cursor
    MOV BH, 0            ; Page 0
    MOV BL, 07h          ; White on black
    MOV CX, len1
    MOV DH, 0Ch          ; Row 12
    MOV DL, (80 - len1) / 2  ; Center column
    MOV BP, OFFSET str1
    INT 10h

    ; ===== Print Course (Row 13) =====
    MOV AH, 13h
    MOV AL, 0
    MOV BH, 0
    MOV BL, 07h
    MOV CX, len2
    MOV DH, 0Dh          ; Row 13
    MOV DL, (80 - len2) / 2
    MOV BP, OFFSET str2
    INT 10h

    ; ===== Print Contact (Row 14) =====
    MOV AH, 13h
    MOV AL, 0
    MOV BH, 0
    MOV BL, 07h
    MOV CX, len3
    MOV DH, 0Eh          ; Row 14
    MOV DL, (80 - len3) / 2
    MOV BP, OFFSET str3
    INT 10h

    ; ===== Print Email (Row 15) =====
    MOV AH, 13h
    MOV AL, 0
    MOV BH, 0
    MOV BL, 07h
    MOV CX, len4
    MOV DH, 0Fh          ; Row 15
    MOV DL, (80 - len4) / 2
    MOV BP, OFFSET str4
    INT 10h

    ; Exit
    MOV AX, 4C00H
    INT 21H
END
