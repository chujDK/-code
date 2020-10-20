assume cs:code,ss:stack,ds:data

stack segment
    dw 0,0,0,0,0,0,0,0
stack ends

data segment
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
data ends

code segment
    start:
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,0

    mov cx,4
    mov bx,0
    s1:
        push cx
        mov cx,4
        mov di,0
        s2:
            mov al,3[bx][di]
            and al,11011111b
            mov 3[bx][di],al
            inc di
        loop s2
        add bx,16
        pop cx
    loop s1
    
    mov ax,4c00h
    int 21h
code ends

end start