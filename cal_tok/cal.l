%{
#include <iostream>   
%}
/* recognize tokens for the calculator and print them out */
%%
"+"    { std::cout << "PLUS" << std::endl; }
"-"    { std::cout << "MINUS" << std::endl; }
"*"    { std::cout << "MULTIP" << std::endl; }
"/"    { std::cout << "DIVIDE" << std::endl; }
"|"    { std::cout << "ABS" << std::endl; }
[0-9]+ { std::cout << "NUMBER " << yytext << std::endl; }
\n     { std::cout << "NEWLINE " << std::endl; }
[ \t]  {  }
.      { std::cout << "Invalid" << std::endl; }
%%

/* main */
int main() {
    yylex();
    return 0;
}