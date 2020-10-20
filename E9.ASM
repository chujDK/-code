assume cs:code,ds:data

data segment
    db 'welcome to masm!'
    db 00000010b,10100100b,00000001b
data ends

code segment
    start:
    mov ax,data
    mov ds,ax

    mov ax,0b800h
    mov es,ax
    mov bx,0
    mov cx,2000
    sclear:
        mov word ptr es:[bx],0
        add bx,2
    loop sclear

    mov ax,0b878h
    mov es,ax
    s:
    mov bx,0
    mov cx,16
    mov di,0
    s0:
        mov al,[bx]
        mov es:64[di],al
        mov es:224[di],al
        mov es:384[di],al
        
        mov al,ds:[10h]
        mov es:65[di],al
        
        mov al,ds:[11h]
        mov es:225[di],al

        mov al,ds:[12h]
        mov es:385[di],al

        inc bx
        add di,2
    loop s0
    jmp short s
    mov ax,4c00h
    int 21h
code ends

end start