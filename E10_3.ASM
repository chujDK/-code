assume cs:code,ds:data,ss:stack

data segment
    db 10 dup(0)
data ends

stack segment
    dd 16 dup(0)
stack ends


code segment
main:
    mov ax,12666
    mov bx,data
    mov ds,bx
    mov bx,stack
    mov ss,bx
    mov sp,64
    mov si,0
    call clear_screen
    call dtoc

    mov dh,8
    mov dl,3
    mov cl,2
    call show_str
    lo:
    jmp short lo
    mov ax,4c00h
    int 21h

clear_screen:
    push bx
    push cx
    push es

    mov bx,0b800h
    mov es,bx
    mov bx,0
    mov cx,2000
    sclear:
        mov word ptr es:[bx],0
        add bx,2
    loop sclear

    pop es
    pop cx
    pop bx
ret;clear_screen

dtoc:
    push ax
    push bx
    push cx
    push dx
    mov cx,ax
    mov bx,10
    mov dh,0
    s0:
        jcxz break
        mov ax,cx
        mov dx,0
        div bx
        add dl,48
        push dx
        mov cx,ax
        inc si
    jmp short s0

    break:
    mov cx,si
    mov si,0
    s1:
        pop dx
        mov ds:[si],dl
        inc si
    loop s1
    pop dx
    pop cx
    pop bx
    pop ax
ret

show_str:
    push ax
    push bx
    push dx
    push si

    mov si,0
	mov di,0
	mov ax,0b800h
	mov es,ax
    ;处理行地址偏移
    mov al,160
	mul dh

    ;以bx为列地址偏移寄存器
    mov bx,ax
	add bl,dl
	add bl,dl

    mov dl,cl
    proccess:
        ;判断字符是否为零
        mov cl,ds:[si]
        mov ch,0
        jcxz break_s

        mov ch,dl
        mov es:[bx][di],cx
        inc si
        add di,2
    jmp short proccess
    
    break_s:
    mov cl,dl
    pop si
    pop dx
    pop bx
    pop ax
ret;show_str

code ends

end main