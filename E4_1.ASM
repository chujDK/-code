assume cs:codesg

codesg segment
    mov ax,0
    mov ds,ax
    mov bx,200h
    mov cx,40h
    s:mov [bx],ax
      inc ax
      inc bx
    loop s
    mov ax,4c00h
    int 21h
codesg ends

end