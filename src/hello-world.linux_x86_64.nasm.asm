BITS 64
EXTERN _exit
GLOBAL _start

SECTION .rodata
  hello db "Hello, world!", 10
  hello_len equ $ - hello
	
SECTION .text
	
_start:                ;User prompt
  mov rax, 1
  mov rdi, 1
  mov rsi, hello
  mov rdx, hello_len
  syscall
    
  ; Exit code
  mov rax, 60
  mov rdi, 0
  syscall
