%{
#include <stdio.h>
#include <math.h>
#include <strings.h>
%}

/* Define tokens */
%token INTEGER FLOAT CHAR STRING
%token IDENTIFIER

/* Define the union for passing from lex */
%union {
  int intVal;
  float floatVal;
  char *charVal;
  char *identifierVal;
}

%type <intVal> Numbers P0 expr

/* Define mathematical recursion */
/* Lower in the list gets priority */
%left '+' '-'
%left '*' '/' "//" '%'
%left '(' ')'

%%
expr:P0 {printf("\nResult: %d\n",$$); return 0;}


/* Higher priority in the tree goes lower */
/* Add/Subtract Expressions */
P0:P0'+'P0   {$$ = $1 + $3;}
  |P0'-'P0   {$$ = $1 - $3;}
  |P0'*'P0   {$$ = $1 * $3;}
  |Numbers   {$$ = $1;}
  /* |P1        {$$ = $1;} */
;

/* Multiply/Divide/Integer Divide Expressions */
/* P1:P1'*'P1   {$$ = $1 * $3;}
  |P1'/'P1   {$$ = $1 / $3;}
  |P1"//"P1  {$$ = floor($1 / $3);}
  |Numbers   {$$ = $1;}
; */

/* Bottom Space to hold the number parsing */
Numbers:INTEGER {$$ = yylval.intVal;}
;

%%

void main() {
   yyparse();
}

void yyerror(const char *s){
  printf("%s\n", s);
}
