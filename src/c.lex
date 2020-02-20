%{
#include <stdio.h>
#include <strings.h>
#include "y.tab.h"
%}

%%
([0-9]*) {yylval->intVal = atoi(yytext); return INTEGER;}
([0-9]*[.][0-9][0-9]*) {yylval->floatVal = atof(yytext); return FLOAT;}
(("\'"|"\"")[a-zA-z0-9]("\'"|"\"")) {strcpy(yylval->charVal, yytext); return CHAR;}

([a-z][a-zA-Z0-9]) {strcpy(yylval->identifierVal, yytext); return IDENTIFIER}

("//".*) {;}
([/][*]([^*]|[*]*[^*/])*[*]+[/]) {;}
(" ") {;}
("\n") {;}
%%

int yywrap() {return 1;}
