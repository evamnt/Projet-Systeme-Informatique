all: clean compiler.l compiler.y symboles.c table_instructions.c
	yacc -d compiler.y
	flex compiler.l
	gcc lex.yy.c y.tab.c symboles.c table_instructions.c -o compiler
	./compiler < input.c
clean: 
	rm -f output.asm
