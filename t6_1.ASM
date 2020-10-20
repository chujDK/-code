assume cs:code

code segment
    dw 1234h,5425h,123h,0ad34h
    stat: mov ax,cs:[0]

    mov ax,4c00h
    int 21h
code ends

end stat