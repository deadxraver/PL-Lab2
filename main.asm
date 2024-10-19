%include "lib.inc"
%include "dict.inc"
%include "words.inc"

section .data
buffer:         times 256 db 0  ; 255 + null-terminator
word_not_found: db "there is no such word", 0
overflow:       db "string cannot be greater than 255 bytes", 0

section .text

global _start

_start:
mov   rdi, buffer
mov   rsi, 256
call  read_word
test  rax, rax
jz    of_err

mov   rdi, rax
mov   rsi, first_word_pointer ; defined address of the first element in the dictionary
call  find_word
test  rax, rax
jz    not_found
mov   rdi, rax
add   rdi, 8
push  rdi
call  string_length
pop   rdi
add   rdi, rax
inc   rdi
call  print_string
call  print_newline
xor   rdi, rdi
call  exit

of_err:
  mov   rdi, overflow
  call  print_err
  call  print_newline
  mov   rdi, 1
  call  exit

not_found:
  mov   rdi, word_not_found
  call  print_err
  call  print_newline
  mov   rdi, 1
  call  exit


