assume cs:code

a segment
    db 1,2,3,4,5,6,7,8
a ends

b segment
    db 1,2,3,4,5,6,7,8
b ends

c segment
    db 0,0,0,0,0,0,0,0
c ends

code segment
    start:
    mov ax,cs
    sub ax,1
    mov ss,ax
    sub ax,1
    mov ds,ax
    sub ax,1
    mov es,ax

    mov cx,8
    mov bx,0
    s:mov ax,ds:[bx]
      add ax,es:[bx]
      mov ss:[bx],ax
      inc bx
    loop s

    mov ax,4c00h
    int 21h
code ends

end start