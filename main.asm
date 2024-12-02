%include "lib.inc"
%include "dict.inc"
%include "words.inc"

%define BUF_SZ  256
%define ERROR_C 1
%define OK_C    0

%macro call_nl 1
  call %1
  call print_newline
%endmacro

section .data
;buffer:         times BUF_SZ db 0  ; 255 + null-terminator
word_not_found: db "there is no such word", 0
overflow:       db "string cannot be greater than 255 bytes", 0

section .text

global _start

_start:
sub   rsp, BUF_SZ
mov   rdi, rsp
mov   rsi, BUF_SZ
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
call_nl  print_string
mov   rdi, OK_C
call  exit

of_err:
  mov   rdi, overflow
  call_nl  print_err
  mov   rdi, ERROR_C
  call  exit

not_found:
  mov   rdi, word_not_found
  call_nl  print_err
  mov   rdi, ERROR_C
  call  exit


