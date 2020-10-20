assume cs:codesg

codesg segment

    mov ax,2000h
    mov ss,ax
    mov sp,0
    add sp,10
    pop ax
    pop bx
    push ax
    push bx
    pop ax
    pop bx

    mov ah,4ch
    int 21h
codesg ends

end