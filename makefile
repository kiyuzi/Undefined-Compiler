yaccArgs = --defines
lexArgs = -o src/lex.yy.c
gccFlags = -g -w
nonFlag = -g
sourceFiles = src/lex.yy.c src/y.tab.c

build: src/lex.yy.c src/y.tab.c
	gcc $(gccFlags) $(sourceFiles) -o undef.exe

src/lex.yy.c: src/c.lex
	lex $(lexArgs) src/c.lex

src/y.tab.c: src/c.yacc
	yacc $(yaccArgs) src/c.yacc

full: src/lex.yy.c src/y.tab.c
	gcc $(nonFlag) src/lex.yy.c src/y.tab.c -o undef.exe

clean:
	rm -r undef.exe
