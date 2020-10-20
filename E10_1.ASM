assume cs:code,ds:data,ss:stack

data segment
    db 'Welcome to masm!',0
data ends

stack segment
    dd 8 dup (0)
stack ends

code segment
main:
    mov dh,8
    mov dl,3
    mov cl,2
    mov ax,data
    mov ds,ax
	mov ax,stack
	mov ss,ax
	mov sp,32
    call clear_screen
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
        jcxz break

        mov ch,dl
        mov es:[bx][di],cx
        inc si
        add di,2
    jmp short proccess
    
    break:
    mov cl,dl
    pop si
    pop dx
    pop bx
    pop ax
ret;show_str
code ends

end main