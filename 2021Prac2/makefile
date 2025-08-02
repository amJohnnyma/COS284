all:
	nasm -f elf64 hello.asm -o hello.o
	ld hello.o -o hello

t1:
	nasm -f elf64 task1.asm -o task1.o
	ld task1.o -o task1

t1r:
	./task1

clean:
	rm -f hello.o hello

run:
	./hello

