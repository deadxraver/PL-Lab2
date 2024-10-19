%define first_word_pointer 0
%define next_word_pointer  0

%macro colon 2
  %define first_word_pointer %2
  %2:
    .next_word: dq next_word_pointer
    .word:      db %1, 0
    .explanation:
  %define next_word_pointer %2
%endmacro

