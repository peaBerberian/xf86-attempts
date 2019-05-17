BITS 64
EXTERN _exit
GLOBAL _start

SECTION .data                         ;Data segment
  prompt db 'Please enter a number: ' ;Ask the user to enter a number
  len_prompt equ $-prompt             ;The length of the message
  resp db 'You have entered: '
  len_resp equ $-resp                 

SECTION .bss           ;Uninitialized data
  num resb 5
	
SECTION .text          ;Code Segment
  global _start
	
_start:                ;User prompt
  mov rax, 1
  mov rdi, 1
  mov rsi, prompt
  mov rdx, len_prompt
  syscall

  ;Read and store the user input
  mov rax, 0
  mov rdi, 2
  mov rsi, num  
  mov rdx, 5          ;5 bytes (numeric, 1 for sign) of that information
  syscall
 
  ;Output the message 'The entered number is: '
  mov rax, 1
  mov rdi, 1
  mov rsi, resp
  mov rdx, len_resp
  syscall

  ;Output the number entered
  mov rax, 1
  mov rdi, 1
  mov rsi, num
  mov rdx, 5
  syscall
    
  ; Exit code
  mov rax, 60
  mov rdi, 0
  syscall
