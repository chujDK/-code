assume cs:code,ss:stack

stack segment
    dw 8 dup(0)
stack ends

code segment
main:
    mov ax,stack
    mov ss,ax
    mov ax,4240h
    mov dx,000fh
    mov cx,0ah
    call divdw

    mov ax,4c00h
    int 21h

divdw:
    push bx

    push ax
    ;int(H/N)->[0]
    mov ax,dx
    mov dx,0
    div cx
    mov bx,ax
    ;last ax
    pop ax
    div cx
    mov cx,dx
    mov dx,bx

    pop bx
ret
code ends

end main