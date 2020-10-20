assume cs:code,ss:stack,ds:data

stack segment
    dw 0,0,0,0,0,0,12h
stack ends

data segment
    dw 3521h,1256h
data ends

code segment
    start:
    mov ax,data
    mov ax,stack
    mov ax,ss

    mov ax,4c00h
    int 21h
code ends

end start