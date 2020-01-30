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
  char *charVal
  char *identifierVal
}

/* Define mathematical recursion */
/* Lower in the list gets priority */
%left '+' '-'
%left '*' '/' '//' '%'
%left '(' ')'

%%

/* Math Expressions */
E:E'+'E   {$$ = $1 + $3;}
 |E'-'E   {$$ = $1 - $3;}
 |E'*'E   {$$ = $1 * $3;}
 |E'/'E   {$$ = $1 / $3;}
 |E'//'E  {$$ = floor($1 / $3);}
 |INTEGER {$$ = $1;}
 |FLOAT   {$$ = $1;}
;

/* Variables */
var:IDENTIFIER {;}
   |"int" IDENTIFIER {;}
   |"float" IDENTIFIER {;}
   |"double" IDENTIFIER {;}
   |"int" IDENTIFIER '=' E {;}
   |"float" IDENTIFIER '=' E {;}
   |"double" IDENTIFIER '=' E {;}
;
%%
