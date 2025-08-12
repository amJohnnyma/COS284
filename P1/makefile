all:
	nasm -f elf64 -g -F dwarf p1.asm
	gcc -no-pie -o p1 p1.o
run:
	# gdb --tui ./p1
	./p1

clean:
	rm -f p1 p1.o

