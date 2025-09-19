add:
	nasm -f elf64 add.asm
	gcc -no-pie -o add add.o
addr:
	./add

addc:
	rm -f add add.o

calc:
	nasm -f elf64 calc.asm
	gcc -no-pie -o calc calc.o
calcr:
	./calc

calcc:
	rm -f calc calc.o


mult:
	nasm -f elf64 mult.asm
	gcc -no-pie -o mult mult.o
multr:
	./mult

multc:
	rm -f mult mult.o
