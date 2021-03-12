all:  compiler.l compiler.y
	yacc -d compiler.y
	flex compiler.l
	gcc lex.yy.c y.tab.c -o compiler
	./compiler < input.c
