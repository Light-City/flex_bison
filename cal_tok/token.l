%{
#include<iostream>

enum toketype {
     NUMBER = 258,
     ADD = 259,
     SUB = 260,
     MUL = 261,
     DIV = 262,
     ABS = 263,
     EOL = 264
   };

   int yylval;
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[ \t]   { /* ignore whitespace */ }
\n     { return EOL; }
.       { return *yytext; }  // Return any unrecognized character as is
%%

int main() {
    int token;
    while ((token = yylex()) != 0) {
        if(token == NUMBER) 
            std::cout << "Val " << yylval << ", Token " << token << std::endl;
        else
            std::cout << "Token " << token << std::endl;
    }
    return 0;
}
