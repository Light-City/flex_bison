%{
#include <iostream>
    extern int yylex();
    extern void yyerror(char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%
calclist: /* nothing */                      
 | calclist exp EOL { printf("= %d\n", $2); } 
 ;

exp: factor     
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term     
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER 
 | ABS term   { $$ = $2 >= 0? $2 : - $2; }
;
%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *s) {
   std::cout << "error: " << s << std::endl;
}