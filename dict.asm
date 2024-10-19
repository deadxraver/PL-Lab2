%include "colon.inc"
%include "lib.inc"

section .text

global  find_word

find_word: ; rdi - string, rsi - dictionary element
  .loop:
    test  rsi, rsi
    jz    .end_not_found  ; null pointer == no more elements to compare
    push  rsi             ; save regs before calling function affecting them
    push  rdi
    add   rsi, 8
    call  string_equals   ; check if keys are equal
    pop   rdi
    pop   rsi
    test  rax, rax
    jnz   .end_found      ; if strings are equal, we found what we were looking for
    mov   rsi, [rsi]      ; jump to next element
    jmp   .loop

.end_found:
    mov   rax, rsi        ; put element addr in rax
    ret
  .end_not_found:
    xor   rax, rax        ; clear rax to show that we havent found the word
    ret
