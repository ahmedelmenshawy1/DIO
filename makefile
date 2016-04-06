object:DIO_Prog.c	
	gcc -E DIO_Prog.c -o DIO_Prog.i
	gcc -S DIO_Prog.c -o DIO_Prog.asm
	avr-gcc -g -Os -mmcu=atmega32 -c DIO_prog.c