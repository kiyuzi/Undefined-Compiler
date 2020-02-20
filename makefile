yaccArgs = --defines=bin/y.tab.h -o bin/y.tab.c
lexArgs = -o bin/lex.yy.c
gccFlags = -g -w
nonFlag = -g
sourceFiles = bin/lex.yy.c bin/y.tab.c

build: $(sourceFiles)
	gcc $(gccFlags) $(sourceFiles) -o undef.exe

bin/lex.yy.c: src/c.lex
	lex $(lexArgs) src/c.lex

bin/y.tab.c: src/c.yacc
	yacc $(yaccArgs) src/c.yacc

full: src/lex.yy.c src/y.tab.c
	gcc $(nonFlag) src/lex.yy.c src/y.tab.c -o undef.exe

clean:
	rm bin/*.*
