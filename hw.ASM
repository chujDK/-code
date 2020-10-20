assume cs:codesg,ds:datas  
  
; str字符必须是13位,所以中间加了两个空格,网上很多代码也避开了这个问题,都是通过加空格,拼写错误,反正加个占位符  
; 否则会输出一堆乱码,实在想不明白是什么原因  
datas segment  
str db 'Hello  World!','$'    
datas ends  
  
codesg segment  
    mov ax,datas  
    mov ds,ax  
    lea dx,str  ; 获取str的偏移地址  
    mov ah,9 ; 调用9号功能输出字符串  
    int 21h  
  
    mov ah,4ch  
    int 21h  
codesg ends  
end  