all: clean compiler.l compiler.y symboles.c
	yacc -d compiler.y
	flex compiler.l
	gcc lex.yy.c y.tab.c symboles.c -o compiler
	./compiler < input.c
clean: 
	rm -f output.asm
