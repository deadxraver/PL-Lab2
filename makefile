main:		lib.o main.o dict.o
	ld -o main main.o lib.o dict.o

lib.o: 	lib.asm
	nasm -felf64 -o lib.o lib.asm

main.o:	main.asm lib.o colon.inc
	nasm -felf64 -o main.o main.asm

dict.o:	dict.asm lib.asm colon.inc
	nasm -felf64 -o dict.o dict.asm

test:
	python3 test.py

.PHONY: clean
clean:
	rm -f *.o
