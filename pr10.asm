TITLE pr10.asm
DOSSEG
.MODEL SMALL
.STACK 0100h
.DATA
.CODE
	mov ax, @data
	mov ds, ax

	mov ah, 02h
	mov cx, 1Ah
	mov dl, 41h
	A:int 21h
	inc dl
	LOOP A

	mov dl, bl
	mov dl, 0Ah
	int 21h

	mov ah, 02h
	mov cx, 1Ah
	mov dl, 61h
	B:int 21h
	inc dl
	LOOP B

	mov dl, bl
	mov dl, 0Ah
	int 21h

	mov ah, 02h
	mov cx, 0Ah
	mov dl, 30h
	C:int 21h
	inc dl
	LOOP C
	
	mov ax, 4C00h
	int 21h
END