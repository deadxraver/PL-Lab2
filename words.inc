%include "colon.inc"

section .data

colon "last", last
db "Last word in the dictionary", 0

colon "nothing", nothing
db 0

colon "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", bigtext
db 'ok', 0

colon "test", test
db "testtesttesttest test test", 0

colon "first word", first_word
db "pervoye slovo omg", 0

