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
  mov eax, 4
  mov ebx, 1
  mov ecx, prompt
  mov edx, len_prompt
  int 0x80

  ;Read and store the user input
  mov eax, 3
  mov ebx, 2
  mov ecx, num  
  mov edx, 5          ;5 bytes (numeric, 1 for sign) of that information
  int 0x80
 
  ;Output the message 'The entered number is: '
  mov eax, 4
  mov ebx, 1
  mov ecx, resp
  mov edx, len_resp
  int 0x80  

  ;Output the number entered
  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 5
  int 0x80
   
  ; Exit code
  mov eax, 1
  mov ebx, 0
  int 0x80
