; Zack Torraye C. Santos
; ITC129 LAB SATURDAY 330-630
.MODEL SMALL
.STACK 100h
.DATA
    ; Heart card (top) - centered by leading spaces
    cardH DB "               +-------+",0Dh,0Ah
          DB "               |A      |",0Dh,0Ah
          DB "               |   H   |",0Dh,0Ah
          DB "               |      A|",0Dh,0Ah
          DB "               +-------+",0Dh,0Ah,0Dh,0Ah,'$'

    ; Diamond + Club side by side (middle row)
    cardDC DB "     +-------+                 +-------+",0Dh,0Ah
           DB "     |A      |                 |A      |",0Dh,0Ah
           DB "     |   D   |                 |   C   |",0Dh,0Ah
           DB "     |      A|                 |      A|",0Dh,0Ah
           DB "     +-------+                 +-------+",0Dh,0Ah,0Dh,0Ah,'$'

    ; Spade card (bottom)
    cardS DB "               +-------+",0Dh,0Ah
          DB "               |A      |",0Dh,0Ah
          DB "               |   S   |",0Dh,0Ah
          DB "               |      A|",0Dh,0Ah
          DB "               +-------+",0Dh,0Ah,'$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; clear screen (graphics mode 3)
    MOV AH, 0
    MOV AL, 3
    INT 10h

    ; Print top card (Heart)
    MOV DX, OFFSET cardH
    MOV AH, 09h
    INT 21h

    ; Print middle row (Diamond and Club side-by-side)
    MOV DX, OFFSET cardDC
    MOV AH, 09h
    INT 21h

    ; Print bottom card (Spade)
    MOV DX, OFFSET cardS
    MOV AH, 09h
    INT 21h

    ; return to DOS
    MOV AX, 4C00h
    INT 21h
MAIN ENDP
END MAIN
