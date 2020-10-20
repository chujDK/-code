assume cs:codesg

codesg segment
    mov ax,cs
    mov ds,ax
    mov ax,0020h
    mov es,ax
    mov bx,0
    mov cx,cx
    s:mov al,[bx]
      mov es:[bx],al
      inc bx
      loop s
    
    mov ah,4ch
    int 21h
codesg ends

end