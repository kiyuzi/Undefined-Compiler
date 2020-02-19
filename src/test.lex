%{
#include <stdio.h>
#include <strings.h>
#include "y.tab.h"

%}

%%
([0-9]*) {yylval = atoi(yytext); return INTEGER;}

("//".*) {;}
([/][*]([^*]|[*]*[^*/])*[*]+[/]) {;}
(" ") {;}
("\n") {;}
%%

int yywrap() {return 1;}
